unit KIKTest_ChosseIFKMB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitMil, ExtCtrls;

type
  TKickerChooseIFKMBK = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    IFKCount_Panel: TPanel;
    Label2: TLabel;
    IFKFound_ListBox: TListBox;
    Label3: TLabel;
    IFKSelect_ComboBox: TComboBox;
    Update_Button: TButton;
    Panel3: TPanel;
    Label5: TLabel;
    SubAdr: TLabel;
    SlaveAdr_TEdit: TEdit;
    SubAdr_TEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Update_ButtonClick(Sender: TObject);
    procedure IFKSelect_ComboBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
     KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;

     KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;
     KickerChooseIFKMBK.IFKSelect_ComboBox.Items     := IFKOnline;
     KickerChooseIFKMBK.IFKSelect_ComboBox.ItemIndex := IFKOnlineIndex;
end;


// UPDATE IFK
procedure TKickerChooseIFKMBK.Update_ButtonClick(Sender: TObject);

begin
    // Liste loeschen
    IFKOnline.Clear;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

    KickerChooseIFKMBK.IFKFound_ListBox.Items.Clear;
    KickerChooseIFKMBK.IFKFound_ListBox.Items  := IFKOnline;
    KickerChooseIFKMBK.IFKCount_Panel.Caption  := IntToStr(IFKCount);

    KickerChooseIFKMBK.IFKSelect_ComboBox.Items.Clear;
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

procedure TKickerChooseIFKMBK.Button1Click(Sender: TObject);
begin
   SlaveAdres := StrToInt('$'+ KickerChooseIFKMBK.SlaveAdr_TEdit.Text);
   SubAdres:= StrToInt('$'+ KickerChooseIFKMBK.SubAdr_TEdit.Text);
   IFKAdress := StrToInt('$'+ KickerChooseIFKMBK.IFKSelect_ComboBox.Text);
   KickerChooseIFKMBK.Close;
end;

end.
