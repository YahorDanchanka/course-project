unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DateUtils, System.Generics.Collections,
  System.Generics.Defaults;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    ApplyFilterButton: TButton;
    procedure ApplyFilterButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm4.ApplyFilterButtonClick(Sender: TObject);
var
  i, activeIndex: integer;
  groups: array of groupRecord;
  group: groupRecord;
begin
  if ListBox1.ItemIndex = -1 then
  begin
    ShowMessage('Выберите день недели.');
    exit;
  end;

  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  activeIndex := ListBox1.ItemIndex + 1;

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if DayOfTheWeek(StrToDateTime(groups[i].day)) = activeIndex then
      AddGroupToStringGrid(groups[i]);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
Form4.Color :=$C0DCC0;
end;

end.
