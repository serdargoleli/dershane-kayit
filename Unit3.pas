unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

Uses Unit2,Unit4,Unit5,Unit6;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  Form3.Hide;
  form4.show;
  form2.table.Insert;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  form5.show;
  form3.Hide;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  form6.show;
  form3.Hide;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sorgu: Integer;
begin
  CanClose := false;
  sorgu := Application.MessageBox('Uygulama kapatýlsýn mý?',
    'Dershane Kayýt Otomasyonu', MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    CanClose := true;
    Application.Terminate;
  end;

end;

end.
