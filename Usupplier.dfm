object Ftambah_edit_supplier: TFtambah_edit_supplier
  Left = 0
  Top = 0
  Caption = 'Tambah/Edit Supplier'
  ClientHeight = 318
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 65
    Height = 13
    Caption = 'Kode Supplier'
  end
  object Label2: TLabel
    Left = 40
    Top = 51
    Width = 68
    Height = 13
    Caption = 'Nama Supplier'
  end
  object Label3: TLabel
    Left = 40
    Top = 223
    Width = 34
    Height = 13
    Caption = 'No telp'
  end
  object Label4: TLabel
    Left = 40
    Top = 83
    Width = 74
    Height = 13
    Caption = 'Alamat Supplier'
  end
  object Panel1: TPanel
    Left = 0
    Top = 277
    Width = 376
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 298
      Top = 0
      Height = 41
      Align = alRight
      ExplicitLeft = 272
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object btcancel: TBitBtn
      Left = 301
      Top = 0
      Width = 75
      Height = 41
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btcancelClick
    end
    object btsimpan: TBitBtn
      Left = 223
      Top = 0
      Width = 75
      Height = 41
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = btsimpanClick
    end
  end
  object Edkodesupplier: TEdit
    Left = 136
    Top = 21
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Ednamasupplier: TEdit
    Left = 136
    Top = 48
    Width = 217
    Height = 21
    TabOrder = 2
  end
  object Ednotelp: TEdit
    Left = 136
    Top = 220
    Width = 217
    Height = 21
    TabOrder = 4
  end
  object Memoalamat: TMemo
    Left = 136
    Top = 83
    Width = 217
    Height = 131
    TabOrder = 3
  end
end
