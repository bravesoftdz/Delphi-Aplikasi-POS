object Ftambah_edit_pembelian: TFtambah_edit_pembelian
  Left = 0
  Top = 0
  Caption = 'Tambah/Edit Pembelian'
  ClientHeight = 498
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Kode Pembelian'
  end
  object Label2: TLabel
    Left = 40
    Top = 51
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object Label3: TLabel
    Left = 40
    Top = 143
    Width = 82
    Height = 13
    Caption = 'No Bukti/Kwitansi'
  end
  object Label4: TLabel
    Left = 40
    Top = 83
    Width = 68
    Height = 13
    Caption = 'Nama Supplier'
  end
  object Label5: TLabel
    Left = 40
    Top = 115
    Width = 65
    Height = 13
    Caption = 'Kode Supplier'
  end
  object Panel1: TPanel
    Left = 0
    Top = 457
    Width = 717
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 639
      Top = 0
      Height = 41
      Align = alRight
      ExplicitLeft = 272
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object btcancel: TBitBtn
      Left = 642
      Top = 0
      Width = 75
      Height = 41
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btcancelClick
    end
    object btsimpan: TBitBtn
      Left = 564
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
    Top = 112
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Ednobukti: TEdit
    Left = 136
    Top = 143
    Width = 217
    Height = 21
    TabOrder = 5
  end
  object Dtpembelian: TDateTimePicker
    Left = 136
    Top = 48
    Width = 121
    Height = 21
    Date = 44697.000000000000000000
    Time = 0.780725127311598000
    TabOrder = 2
  end
  object Edkodepembelian: TEdit
    Left = 136
    Top = 21
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 192
    Width = 717
    Height = 265
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 717
      Height = 265
      Align = alClient
      DataSource = Dscds1
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColExit = DBGrid1ColExit
      Columns = <
        item
          Expanded = False
          FieldName = 'kode_barang'
          Title.Caption = 'Kode Barang'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nama_barang'
          Title.Caption = 'Nama Barang'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'satuan'
          Title.Caption = 'Satuan'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'harga_beli'
          Title.Caption = 'Harga Beli'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Caption = 'Qty'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub_total'
          Title.Caption = 'Sub Total'
          Width = 100
          Visible = True
        end>
    end
  end
  object cbnama_supplier: TComboBox
    Left = 136
    Top = 80
    Width = 233
    Height = 21
    TabOrder = 3
    OnChange = cbnama_supplierChange
    OnDropDown = cbnama_supplierDropDown
  end
  object CDS1: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A6000B6B6F64
      655F626172616E6701004900000001000557494454480200020014000B6E616D
      615F626172616E67010049000000010005574944544802000200C80006736174
      75616E01004900000001000557494454480200020014000A68617267615F6265
      6C690800040000000000037174790800040000000000097375625F746F74616C
      08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'kode_barang'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nama_barang'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'satuan'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'harga_beli'
        DataType = ftFloat
      end
      item
        Name = 'qty'
        DataType = ftFloat
      end
      item
        Name = 'sub_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 240
    object CDS1kode_barang: TStringField
      FieldName = 'kode_barang'
    end
    object CDS1nama_barang: TStringField
      FieldName = 'nama_barang'
      Size = 200
    end
    object CDS1satuan: TStringField
      FieldName = 'satuan'
    end
    object CDS1harga_beli: TFloatField
      FieldName = 'harga_beli'
    end
    object CDS1qty: TFloatField
      FieldName = 'qty'
    end
    object CDS1sub_total: TFloatField
      FieldName = 'sub_total'
    end
  end
  object Dscds1: TDataSource
    DataSet = CDS1
    Left = 24
    Top = 240
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 320
    object Insert1: TMenuItem
      Caption = 'Insert'
      ShortCut = 16462
      OnClick = Insert1Click
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      ShortCut = 113
      OnClick = Edit1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      OnClick = Delete1Click
    end
  end
end
