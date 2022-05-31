unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    CategoryComboBox: TComboBox;
    AddFacilityButton: TButton;
    SecretEdit: TEdit;
    procedure AddFacilityButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.AddFacilityButtonClick(Sender: TObject);
begin
  SecretEdit.Text := '1';
  Form4.Close;
end;

end.
