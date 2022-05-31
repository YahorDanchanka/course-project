unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Unit2;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    AddressEdit: TEdit;
    Label2: TLabel;
    OwnerFullNameEdit: TEdit;
    Label3: TLabel;
    PriceEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    AddFacilityButton: TButton;
    CategoryComboBox: TComboBox;
    DescriptionEdit: TEdit;
    CustomerFullNameEdit: TEdit;
    SaleDateDateTimePicker: TDateTimePicker;
    procedure AddFacilityButtonClick(Sender: TObject);
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AddFacilityButtonClick(Sender: TObject);
var
  facility: FacilityRecord;
  i: integer;
begin
  for i := 0 to Form3.ComponentCount - 1 do
    if Form3.Components[i] is TEdit then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

  facility.category := CategoryComboBox.Text;
  facility.address := AddressEdit.Text;
  facility.ownerFullName := OwnerFullNameEdit.Text;
  facility.price := PriceEdit.Text;
  facility.description := DescriptionEdit.Text;
  facility.customerFullName := CustomerFullNameEdit.Text;
  facility.saleDate := DateToStr(SaleDateDateTimePicker.Date);

  if Pos('добавить', AnsiLowerCase(Form3.Caption)) <> 0 then AddFacilityToStringGrid(facility);
  Form3.Close;
end;

procedure TForm3.PriceEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

end.
