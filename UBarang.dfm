object Ftambah_edit_barang: TFtambah_edit_barang
  Left = 0
  Top = 0
  Caption = 'Tambah/Edit Barang'
  ClientHeight = 318
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 61
    Height = 13
    Caption = 'Kode Barang'
  end
  object Label2: TLabel
    Left = 40
    Top = 51
    Width = 64
    Height = 13
    Caption = 'Nama Barang'
  end
  object Label3: TLabel
    Left = 40
    Top = 78
    Width = 42
    Height = 13
    Caption = 'Deskripsi'
  end
  object Label4: TLabel
    Left = 40
    Top = 105
    Width = 34
    Height = 13
    Caption = 'Satuan'
  end
  object Label5: TLabel
    Left = 40
    Top = 159
    Width = 40
    Height = 13
    Caption = 'Stok Min'
  end
  object Label6: TLabel
    Left = 40
    Top = 134
    Width = 47
    Height = 13
    Caption = 'Stok Awal'
  end
  object Label7: TLabel
    Left = 40
    Top = 186
    Width = 51
    Height = 13
    Caption = 'Harga Jual'
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
  object Chflg_aktif: TCheckBox
    Left = 136
    Top = 210
    Width = 97
    Height = 17
    Caption = 'Flg Aktif'
    TabOrder = 1
    OnClick = Chflg_aktifClick
  end
  object Edkodebarang: TEdit
    Left = 136
    Top = 21
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Ednamabarang: TEdit
    Left = 136
    Top = 48
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object Eddeskripsi: TEdit
    Left = 136
    Top = 75
    Width = 217
    Height = 21
    TabOrder = 4
  end
  object cbsatuan: TComboBox
    Left = 136
    Top = 102
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = 'PCS'
    Items.Strings = (
      'PCS'
      'KG'
      'GR')
  end
  object Edstokawal: TEdit
    Left = 136
    Top = 129
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edstokmin: TEdit
    Left = 136
    Top = 156
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Edhargajual: TEdit
    Left = 136
    Top = 183
    Width = 121
    Height = 21
    TabOrder = 8
  end
end
