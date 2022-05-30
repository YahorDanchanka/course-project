unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit2;

type
  TForm5 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
  groups: array of groupRecord;
  i: integer;
begin
  if ListBox1.ItemIndex = -1 then exit;
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
  begin
    if ListBox1.Items[ListBox1.ItemIndex] = groups[i].ticketType then
      groups[i].price := FloatToStr(StrToFloat(Edit1.Text) + StrToFloat(groups[i].price));

    AddGroupToStringGrid(groups[i]);
  end;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

procedure TForm5.FormActivate(Sender: TObject);
var
  groups: array of groupRecord;
  i: integer;
begin
  SetLength(groups, Form2.StringGrid1.RowCount - 1);
  ListBox1.Items.Clear;

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  for i := 0 to Length(groups) - 1 do
    if ListBox1.Items.IndexOf(groups[i].ticketType) = -1 then ListBox1.Items.Add(groups[i].ticketType);
end;
end.
