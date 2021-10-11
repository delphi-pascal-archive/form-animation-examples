unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}
 procedure ScreenShot(cpicture: TBitMap);
var
  c: TCanvas;
  r: TRect;
begin
  c := TCanvas.Create;
  //this gets the Desktop handle
  c.Handle := GetWindowDC(GetDesktopWindow);
  try
    r := Rect(0, 0, Screen.Width, Screen.Height);
    cpicture.Width := Screen.Width;
    cpicture.Height := Screen.Height;
    cpicture.Canvas.CopyRect(r, c, r);
    showmessage('Screen Captured');
  finally
    ReleaseDC(0, c.Handle);
    c.Free;
  end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
Form5.Visible := False;
  Sleep(300); // some delay, 
  ScreenShot(Image1.Picture.BitMap);
  form5.WindowState :=wsmaximized;
  Form5.Visible := True;

end;

procedure TForm5.Button2Click(Sender: TObject);
begin
savedialog1.Execute;
if savedialog1.FileName <>'' then
image1.Picture.Bitmap.SaveToFile(savedialog1.FileName) 
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
close;
end;

end.
