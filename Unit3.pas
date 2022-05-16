unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Unit2;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure AddSaleToStringGrid(sale: saleRecord);

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure AddSaleToStringGrid(sale: saleRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := sale.title;
  Form2.StringGrid1.Cells[1, rowIndex] := sale.foodSet;
  Form2.StringGrid1.Cells[2, rowIndex] := sale.price;
  Form2.StringGrid1.Cells[3, rowIndex] := sale.percent;
  Form2.StringGrid1.Cells[4, rowIndex] := sale.startDate;
  Form2.StringGrid1.Cells[5, rowIndex] := sale.endDate;
  Form2.StringGrid1.Cells[6, rowIndex] := sale.description;
end;

procedure TForm3.AddSaleButtonClick(Sender: TObject);
var sale: saleRecord;
begin
  sale.title := TitleEdit.Text;
  sale.foodSet := FoodSetEdit.Text;
  sale.price := PriceEdit.Text;
  sale.percent := PercentEdit.Text;
  sale.startDate := DateToStr(StartDateTimePicker.Date);
  sale.endDate := DateToStr(StartDateTimePicker.Date);
  sale.description := DescriptionEdit.Text;
  AddSaleToStringGrid(sale);
  Form3.Close;
end;

end.
