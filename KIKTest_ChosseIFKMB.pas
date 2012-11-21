unit KIKTest_ChosseIFKMB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitMil, ExtCtrls;

type
  TKickerChooseIFKMBK = class(TForm)
    OKButton: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    IFKCount_Panel: TPanel;
    Label2: TLabel;
    IFKFound_ListBox: TListBox;
    Label3: TLabel;
    IFKSelect_ComboBox: TComboBox;
    Update_Button: TButton;
    Panel3: TPanel;
    SubAdr: TLabel;
    SubAdr_TEdit: TEdit;
    SlaveAdr4CheckBox: TCheckBox;
    SlaveAdr1CheckBox: TCheckBox;
    SlaveAdr2CheckBox: TCheckBox;
    SlaveAdr3CheckBox: TCheckBox;
    SlaveAdr5CheckBox: TCheckBox;
    SlaveAdr6CheckBox: TCheckBox;
    SlaveAdr7CheckBox: TCheckBox;
    SlaveAdr8CheckBox: TCheckBox;
    SlaveAdr9CheckBox: TCheckBox;
    SlaveAdr10CheckBox: TCheckBox;
    SlaveAdr11CheckBox: TCheckBox;
    SlaveAdr12CheckBox: TCheckBox;
    Label4: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Update_ButtonClick(Sender: TObject);
    procedure IFKSelect_ComboBoxChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KickerChooseIFKMBK: TKickerChooseIFKMBK;
  KickerSearch:boolean;

implementation

uses modulbus, KiKTest_GlobalVariable;



{$R *.DFM}

procedure TKickerChooseIFKMBK.FormCreate(Sender: TObject);

begin
     //IFK
     KickerChooseIFKMBK.IFKCount_Panel.Caption := IntToStr(IFKCount);
     KickerChooseIFKMBK.IFKFound_ListBox.Items.Clear;
     KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;

     if (IFKCount <> 0) then begin
       KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;
       KickerChooseIFKMBK.IFKSelect_ComboBox.Items     := IFKOnline;
       KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex := IFKOnlineIndex;
       KickerChooseIFKMBK.OKButton.Click;
     end;
end;


// UPDATE IFK
procedure TKickerChooseIFKMBK.Update_ButtonClick(Sender: TObject);

begin
    // Liste loeschen
    IFKOnline.Clear;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

    KickerChooseIFKMBK.IFKFound_ListBox.Items.Clear;
    KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;
    KickerChooseIFKMBK.IFKCount_Panel.Caption  := IntToStr(IFKCount);


    if(IFKCount <> 0) then begin
      KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;
      KickerChooseIFKMBK.IFKSelect_ComboBox.Items     := IFKOnline;
      KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex := 0;
      IFKOnlineIndex := 0;

      // Auswahl IFK aussuchen
      try
         IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
     except
         messagebox(0,'Keine IFK gefunden !','Warnung',16);
      end;
    end;
end;

// IFK select click !
procedure TKickerChooseIFKMBK.IFKSelect_ComboBoxChange(Sender: TObject);
begin
     IFKOnlineIndex := KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex;

     try
        IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
     except
        messagebox(0,'Ungültige IFK !','Warnung',16);
     end;
end;

procedure TKickerChooseIFKMBK.OKButtonClick(Sender: TObject);

var counterstart:_DWORD;

begin
   SlaveOnlineCounter:= 0;
   counterstart:=0;

   if(SlaveAdr1CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 1;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr2CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 2;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
    end;

   if(SlaveAdr3CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 3;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
    end;

   if(SlaveAdr4CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 4;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr5CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 5;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr6CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 6;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr7CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 7;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr8CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 8;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr9CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= 9;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr10CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= $A;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr11CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= $B;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;

   if(SlaveAdr12CheckBox.Checked = true) then begin
     SlaveOnlineCounter:= SlaveOnlineCounter + 1;
     SlaveAdress[SlaveOnlineCounter].SlaveAdr:= $C;
     counterstart:= counterstart + 1;
     SlaveAdress[SlaveOnlineCounter].Counter:= counterstart;
   end;


   // Eingabefeld sub-adresse uebernehmen
   try
      SubAdres:= StrToInt('$'+ KickerChooseIFKMBK.SubAdr_TEdit.Text);
   except
        messagebox(0,'Ungültige Eingabe !','DEPP',16);
   end;

   try
      IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
   except
        //messagebox(0,'Keine IFK gefunden !','Huch ?',16);
   end;

   if(SlaveOnlineCounter = 0) then Application.MessageBox('Es wurde kein Slave angewählt !','Wer kriecht, kann nicht stolpern',48);


   KickerChooseIFKMBK.Close;
end;

end.
