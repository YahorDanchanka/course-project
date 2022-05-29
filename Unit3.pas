unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    TitleEdit: TEdit;
    FoodSetEdit: TEdit;
    Label2: TLabel;
    PriceEdit: TEdit;
    Label3: TLabel;
    PercentEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DescriptionEdit: TEdit;
    Label7: TLabel;
    AddSaleButton: TButton;
    StartDateTimePicker: TDateTimePicker;
    EndDateTimePicker: TDateTimePicker;
    procedure AddSaleButtonClick(Sender: TObject);
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.AddSaleButtonClick(Sender: TObject);
var
  i: integer;
  sale: saleRecord;
begin
  for i := 0 to Form3.ComponentCount - 1 do
    if Form3.Components[i] is TEdit then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

  sale.title := TitleEdit.Text;
  sale.foodSet := FoodSetEdit.Text;
  sale.price := PriceEdit.Text;
  sale.percent := PercentEdit.Text;
  sale.startDate := DateToStr(StartDateTimePicker.Date);
  sale.endDate := DateToStr(EndDateTimePicker.Date);
  sale.description := DescriptionEdit.Text;
  AddSaleToStringGrid(sale);
  Form3.Close;
end;

procedure TForm3.PriceEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

end.
