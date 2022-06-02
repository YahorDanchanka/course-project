unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Unit2;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FullnameEdit: TEdit;
    Label3: TLabel;
    PriceEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CountEdit: TEdit;
    Label7: TLabel;
    AddGroupButton: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    NumberComboBox: TComboBox;
    LevelComboBox: TComboBox;
    procedure AddGroupButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure FullnameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure AddGroupToStringGrid(group: groupRecord);

var
  Form3: TForm3;

implementation

{$R *.dfm}

function IsRussianChars(const S: String): Boolean;
var
  i: Integer;
begin
  Result:= True;
  for i:= 1 to Length(S) do
    if (Ord(S[i]) >= $C0)
        or (Ord(S[i]) = $A8)
        or (Ord(S[i]) = $B8)
    then Exit;
  Result:= False;
end;

procedure AddGroupToStringGrid(group: groupRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;
  Form2.StringGrid1.Options := Form2.StringGrid1.Options + [goEditing];


  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := group.number;
  Form2.StringGrid1.Cells[1, rowIndex] := group.level;
  Form2.StringGrid1.Cells[2, rowIndex] := group.fullName;
  Form2.StringGrid1.Cells[3, rowIndex] := group.price;
  Form2.StringGrid1.Cells[4, rowIndex] := group.day;
  Form2.StringGrid1.Cells[5, rowIndex] := group.time;
  Form2.StringGrid1.Cells[6, rowIndex] := group.studentsCount;
end;

procedure TForm3.AddGroupButtonClick(Sender: TObject);
var
  group: groupRecord;
  i: integer;
begin
  for i := 0 to Form3.ComponentCount - 1 do
    if Form3.Components[i] is TEdit then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

  group.number := NumberComboBox.Text;
  group.level := LevelComboBox.Text;
  group.fullName := FullnameEdit.Text;
  group.price := PriceEdit.Text;
  group.day := DateToStr(DateTimePicker1.Date);
  group.time := TimeToStr(DateTimePicker2.Time);
  group.studentsCount := CountEdit.Text;
  AddGroupToStringGrid(group);
  Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
Form3.Color :=$C0DCC0;
end;

procedure TForm3.FullnameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not ((Key in [' ', #8]) or (IsRussianChars(Key))) then Key := #0;
end;

procedure TForm3.PriceEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

end.
