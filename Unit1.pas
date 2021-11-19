unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  count: Integer;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.FormCreate(Sender: TObject);
begin
  (Image1.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := '% ' + IntToStr(count);
  if (count >= 100) then
  begin
    Timer1.Enabled := False;
    Form1.AlphaBlend := True;
    Form1.AlphaBlendValue := 0;
    Form2.Show;
  end;
  Inc(count);
end;

end.
