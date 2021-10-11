unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  MovingRgn: HRGN; // holds a region
implementation

{$R *.dfm}

procedure TForm6.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close; //close if 'Escape'
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
MovingRgn := CreateEllipticRgn(0, 0, 100, 100);
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
 DeleteObject(MovingRgn);
end;

procedure TForm6.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
TempBitmap: TBitmap; // holds an offscreen bitmap
begin

{create the offscreen bitmap and initialize its size to that of the
invisible TImage. this offscreen bitmap is used to eliminate flicker}
TempBitmap := TBitmap.Create;
TempBitmap.Width := Image1.Width;
TempBitmap.Height := Image1.Height;
 ExtSelectClipRgn(TempBitmap.Canvas.Handle, MovingRgn, RGN_AND);
{move the clipping region to the position being tracked}
OffsetClipRgn(TempBitmap.Canvas.Handle, x-25, y-25);
{draw the picture stored in Image1 into the bitmap. the clipping region will
only allow the bitmap to be drawn within the small circular area of the
region}
TempBitmap.Canvas.Draw(0, 0, Image1.Picture.Bitmap);
 {draw the offscreen bitmap to the form. this will result in an animation of
a small, bouncing circle}
Canvas.Draw(Image1.Left, Image1.Top, TempBitmap);
{free the offscreen bitmap}
TempBitmap.Free;
end;

end.
