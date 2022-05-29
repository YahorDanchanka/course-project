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
  sales: array of saleRecord;
  i: integer;
begin
  if (length(storageFilePath) = 0) or (ListBox1.ItemIndex = -1) then exit;

  AssignFile(storageFile, storageFilePath);
  Reset(storageFile);
  SetLength(sales, Filesize(storageFile));

  for i := 0 to Filesize(storageFile) - 1 do
    read(storageFile, sales[i]);

  CloseFile(storageFile);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
  begin
    if (sales[i].title = ListBox1.Items[ListBox1.ItemIndex]) and (StrToFloat(sales[i].percent) + 3 <= 100) then
      sales[i].percent := FloatToStr(StrToFloat(sales[i].percent) + 3);
    AddSaleToStringGrid(sales[i]);
  end;

  AssignFile(storageFile, storageFilePath);
  Rewrite(storageFile);

  for i := 0 to Length(sales) - 1 do
    write(storageFile, sales[i]);

  CloseFile(storageFile);
end;

end.
