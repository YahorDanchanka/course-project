unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    ListBox1: TListBox;
    ApplyFilterButton: TButton;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ApplyFilterButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm5.ApplyFilterButtonClick(Sender: TObject);
var
  i: integer;
  price: real;
  group: groupRecord;
begin
  if ListBox1.ItemIndex = -1 then
  begin
    ShowMessage('Выберите уровень.');
    exit;
  end;

  if Form2.StringGrid1.RowCount <= 1 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  // Skip first row
  for i := 1 to Form2.StringGrid1.RowCount - 1 do
  begin
    group := createGroupFromStringGrid(i);
    if group.level <> ListBox1.Items[ListBox1.ItemIndex] then continue;

    price := StrToFloat(group.price);
    Form2.StringGrid1.Cells[3, i] := FloatToStr(round(price + (price * 10 / 100)));
  end;
end;

procedure TForm5.FormActivate(Sender: TObject);
var i: integer;
begin
  ListBox1.Items.Clear;

  for i := 0 to Length(levels) - 1 do
    ListBox1.Items.Add(levels[i]);
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
Form5.Color :=$C0DCC0;
end;

end.
