unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

Uses Unit2, Unit3;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
  Form6.Hide;
  Form3.Show;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
var
  ara: Boolean;
  i: Integer;
begin
  ara := form2.table.Locate('Tc', Edit1.Text, []);
  if (not ara) then
   Application.MessageBox('Öðrenci bulunamadý. TC Noyu eksiksiz yazdýðýnýzdan emin olun.', 'Arama', MB_OK + MB_ICONHAND);

  Edit1.Text := '';
end;

procedure TForm6.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
