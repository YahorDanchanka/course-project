unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    IncreasePercentButton: TButton;
    procedure FormActivate(Sender: TObject);
    procedure IncreasePercentButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
var
  i, j: integer;
  sales: array of saleRecord;
begin
  SetLength(sales, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  for i := 0 to Length(sales) - 1 do
    if ListBox1.Items.IndexOf(sales[i].title) = -1 then ListBox1.Items.Add(sales[i].title);

end;

procedure TForm4.IncreasePercentButtonClick(Sender: TObject);
var
  sale: saleRecord;
  i: integer;
  percent, increasedPercent: real;
begin
  if Form2.StringGrid1.RowCount <= 1 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  for i := 1 to Form2.StringGrid1.RowCount - 1 do
  begin
    sale := createSaleFromStringGrid(i);
    if sale.title = ListBox1.Items[ListBox1.ItemIndex] then
    begin
      percent := StrToFloat(sale.percent);
      increasedPercent := percent + 3;

      if increasedPercent > 100  then exit;

      Form2.StringGrid1.Cells[3, i] := FloatToStr(percent + 3);
    end;
  end;
end;

end.
