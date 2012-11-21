program Fair12KartenTesT;

uses
  Forms,
  KiKTest_EchoTest in 'KiKTest_EchoTest.pas' {KickerEchoTest},
  KIKTest_ChosseIFKMB in 'KIKTest_ChosseIFKMB.pas' {KickerChooseIFKMBK},
  UnitMil in 'PCIMilTreiber_DelphiUnits\UnitMil.pas',
  KiKTest_GlobalVariable in 'KiKTest_GlobalVariable.pas',
  modulbus in 'modulbus.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TKickerEchoTest, KickerEchoTest);
  Application.CreateForm(TKickerChooseIFKMBK, KickerChooseIFKMBK);
  Application.Run;
end.
