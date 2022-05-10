unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    HeaderLabel: TLabel;
    AuthorLabel: TLabel;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
  Form1.Hide;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  HeaderLabel.Left := round((Form1.ClientWidth - HeaderLabel.Width) / 2);
  HeaderLabel.Top := round((Form1.ClientHeight - HeaderLabel.Height) / 2) - 15;
end;

end.
