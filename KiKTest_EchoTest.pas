unit KiKTest_EchoTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus,UnitMil;

type
  TKickerEchoTest = class(TForm)
    Panel1: TPanel;
    Close_Button: TButton;
    Loop_SpeedButton: TSpeedButton;
    Label1: TLabel;
    LoopCounter_Panel: TPanel;
    Label2: TLabel;
    ErrorCounter_Panel: TPanel;
    SystemMess_ListBox: TListBox;
    Label3: TLabel;
    Clear_Button: TButton;
    ErrorStop_CheckBox: TCheckBox;
    Step_Button: TButton;
    ChooseIFKFB: TButton;
    MainMenue: TMainMenu;
    Optionen1: TMenuItem;
    About1: TMenuItem;
    procedure Clear_ButtonClick(Sender: TObject);
    procedure Step_ButtonClick(Sender: TObject);
    procedure Loop_SpeedButtonClick(Sender: TObject);
    procedure Close_ButtonClick(Sender: TObject);
    procedure ChooseIFKFBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure echo_durchlauf(LoopCounter:_DWORD; SlaveIndex:_WORD;var ErrorFound:boolean);
    function SendTesTData(SenData:_WORD;SlaveIndex:_WORD):boolean;

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KickerEchoTest: TKickerEchoTest;

implementation

uses KiKTest_GlobalVariable, modulbus, KIKTest_ChosseIFKMB;

{$R *.DFM}

// Ein Echo durchlauf-Test
procedure TKickerEchoTest.echo_durchlauf(LoopCounter:_DWORD; SlaveIndex:_WORD; var ErrorFound:boolean);

var mySendData:_WORD;
    ErrorStatus:_DWORD;
    ErrorCounter:_WORD;

begin
    ErrorStatus :=0;
    ErrorFound:=false;

    // Als daten wird der counter der jeweiligen slaves verwendet
    mySendData := SlaveAdress[SlaveIndex].Counter;

    // Daten versenden & vergleichen
    ErrorFound:= SendTesTData(mySendData,SlaveIndex);
    // Fehler ->Puls auf buchse ausgeben
    if (ErrorFound =  true) then PCI_SoftPuls1Start(Cardauswahl, ErrorStatus);

    // Daten Invertieren,senden & vergleichen
    ErrorFound:= SendTesTData(not(mySendData),SlaveIndex);
    // Fehler ->Puls auf buchse ausgeben
    if (ErrorFound =  true) then PCI_SoftPuls1Start(Cardauswahl, ErrorStatus);

    // den slave counter um eins erhöhen
    SlaveAdress[SlaveIndex].Counter:= SlaveAdress[SlaveIndex].Counter + 1;
    // slave nicht höher wie 65536  den FFFF soll er ja noch mitnehmen
    if(SlaveAdress[SlaveIndex].Counter mod $10000 =0) then SlaveAdress[SlaveIndex].Counter:=0;

    // Ausgabe
    if(LoopCounter mod 1000 = 0) or (ErrorFound = True) then begin
       if(Error = True) then begin
         ErrorCounter:= StrToInt(KickerEchoTest.ErrorCounter_Panel.Caption);
         ErrorCounter:= ErrorCounter + 1;
         KickerEchoTest.ErrorCounter_Panel.Caption := IntToStr(ErrorCounter);
       end else begin
           KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
       end;

       KickerEchoTest.Update;
       Application.ProcessMessages;
    end;
end;


procedure TKickerEchoTest.Clear_ButtonClick(Sender: TObject);

var ErrStatus:_DWORD;

begin
     KickerEchoTest.Loop_SpeedButton.Down := false;
     KickerEchoTest.LoopCounter_Panel.Caption  := '0';
     KickerEchoTest.ErrorCounter_Panel.Caption := '0';
     KickerChooseIFKMBK.OKButton.Click;
     KickerEchoTest.SystemMess_ListBox.Clear;
end;



procedure TKickerEchoTest.Step_ButtonClick(Sender: TObject);

var LoopCounter:_DWORD;
    Error:boolean;
    SlaveIndex:_WORD;


begin
     Error:=false;
     SlaveIndex:= 0;

     KickerEchoTest.Loop_SpeedButton.Down := false;
     LoopCounter:= StrToInt(KickerEchoTest.LoopCounter_Panel.Caption);

     while (SlaveIndex < SlaveOnlineCounter) do
     begin
          LoopCounter := LoopCounter +1;
          SlaveIndex:= SlaveIndex + 1;
          echo_durchlauf(LoopCounter,SlaveIndex,Error);
     end;

     KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
end;

procedure TKickerEchoTest.Loop_SpeedButtonClick(Sender: TObject);

var LoopCounter:_DWORD;
    Error:boolean;
    SlaveIndex:_WORD;

begin
     SlaveIndex:= 0;
     LoopCounter:= StrToInt(KickerEchoTest.LoopCounter_Panel.Caption);

     while KickerEchoTest.Loop_SpeedButton.Down = true do
     begin
          Error:=false;
          LoopCounter := LoopCounter +1;
          SlaveIndex:=SlaveIndex + 1;
          if (SlaveIndex > SlaveOnlineCounter) then SlaveIndex:=1;

          echo_durchlauf(LoopCounter,SlaveIndex,Error);
          if(Error = true) and (KickerEchoTest.ErrorStop_CheckBox.Checked = true)then begin
             KickerEchoTest.Loop_SpeedButton.Down := false;
             KickerEchoTest.Update;
             Application.ProcessMessages;
          end;
     end;
     KickerEchoTest.LoopCounter_Panel.Caption := IntToStr(LoopCounter);
     KickerEchoTest.Update;
    Application.ProcessMessages;
end;

procedure TKickerEchoTest.Close_ButtonClick(Sender: TObject);
begin
     KickerEchoTest.Close;
end;

procedure TKickerEchoTest.ChooseIFKFBClick(Sender: TObject);
begin
     KickerEchoTest.Loop_SpeedButton.Down:= false;
     KickerChooseIFKMBK.ShowModal;
end;

procedure TKickerEchoTest.FormCreate(Sender: TObject);

var
  i: integer;
  index:integer;
  CardCounter: integer;
  status:_DWORD;
  Error_Char:t_Error_Char;
  Error_string:string;


begin
     IFKOnline   := TStringList.Create;

//--------------------------------
//        PCIMil Karte suchen
//--------------------------------


  // PCI Mil Karten zählen
  CardCounter := PCI_PCIcardCount();

  // keine PCIMil Karten vorhanden -> tschüss
  if (CardCounter = 0) then begin
    Application.MessageBox('NO PCI- CARDS FOUND', 'ABBRUCH !', 16);
    KickerEchoTest.Close;
  end;

  if(CardCounter = 1) then begin
    Cardauswahl := 1;
    status := PCI_DriverOpen(Cardauswahl);
    if(status <> StatusOK) then begin
      PCI_ErrorString(status, Error_Char); // ausgabe bei fehlerfall
      for i := 1 to Length(Error_Char) do begin
          Error_string := Error_string + Error_Char[i];
      end;
      Application.MessageBox(PChar(Error_string), 'ABBRUCH !', 16);
      Application.Terminate;
    end;
  end else begin // Es sind mehrere pci-karten da !
    for index:= 1 to CardCounter do begin // Mache alle ducrh
      status := PCI_DriverOpen(index);    // oeffne
       if(status = StatusOK) then begin
         Cardauswahl := index;
         break;
       end;//if(status <> StatusOK)
    end;// for index:= 1 to CardCounter do begin
    if(Cardauswahl = 0) then begin
       Application.MessageBox('NO MASTER CARD FOUND', 'ABBRUCH !', 16);
       Application.Terminate;
    end;
  end; // if(CardCounter = 1) then begin

//------------------------------------------------
//        Puls fuer die pulsbuchse 1 vorbereiten
//------------------------------------------------
  PCI_CntrlRegSet(Cardauswahl, Cntrl_Puls1_Rahmen_Off, status);

//--------------------------------
//        IFKs suchen
//--------------------------------

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

   // Erste IFK nehmen
    try
       IFKAdress := StrToInt('$' + IFKOnline[0]);
       IFKOnlineIndex := 0;
    except
       messagebox(0,'Keine IFK gefunden !','Warnung',16);
       IFKAdress := 0;
    end;
end;

procedure TKickerEchoTest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    KickerEchoTest.Loop_SpeedButton.Down := false;
    KickerEchoTest.Update;
    Application.ProcessMessages;
    PCI_DriverClose(Cardauswahl);
end;

procedure TKickerEchoTest.FormShow(Sender: TObject);
begin
     KickerChooseIFKMBK.OKButton.Click;     
end;

function TKickerEchoTest.SendTesTData(SenData:_WORD; SlaveIndex:_WORD):boolean;

var i:_WORD;
    ReadData:_WORD;
    ErrorStatus:_DWORD;
    Error_Char:t_Error_Char;
    Error_string:string;

begin
    ErrorStatus:=0;
    Error:=false;
    // Daten versenden und wieder lesen
    modulbus_adr_wr(SenData, SubAdres, SlaveAdress[SlaveIndex].SlaveAdr,IFKAdress,ErrorStatus);
    modulbus_adr_rd(ReadData, SubAdres, SlaveAdress[SlaveIndex].SlaveAdr, IFKAdress, ErrorStatus);

    // fehler beachten
    if(ErrorStatus <> StatusOK) then begin
       PCI_ErrorString(ErrorStatus, Error_Char); // ausgabe bei fehlerfall
       for i := 1 to Length(Error_Char) do begin
           Error_string := Error_string + Error_Char[i];
       end;
       KickerEchoTest.SystemMess_ListBox.Items.Add('IFKNr.'+IntToStr(SlaveAdress[SlaveIndex].SlaveAdr)+
                                                   ': ERROR '+Error_string);
       Error := True;
    end;

    // daten vergleichen
    if (ReadData <> SenData) then begin
       KickerEchoTest.SystemMess_ListBox.Items.Add('IFKNr.'+IntToStr(SlaveAdress[SlaveIndex].SlaveAdr)+
                                                   ':ERROR WR '+ IntToHex(SenData,4)+' /RD '+IntToHex(ReadData,4)+
                                                   '  ' + DateTimeToStr(Now));
       Error := True;
    end;
    result:= Error;
end;


end.
