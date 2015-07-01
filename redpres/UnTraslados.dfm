object frmTraslados: TfrmTraslados
  Left = 710
  Top = 272
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Traslados'
  ClientHeight = 547
  ClientWidth = 678
  Color = clBtnFace
  Constraints.MinHeight = 572
  Constraints.MinWidth = 684
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFondo: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 518
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      655
      518)
    object Label1: TLabel
      Left = 4
      Top = 36
      Width = 79
      Height = 13
      Caption = 'Tipo de Traslado'
    end
    object Label2: TLabel
      Left = 296
      Top = 36
      Width = 49
      Height = 13
      Caption = 'Solicitante'
    end
    object Label3: TLabel
      Left = 6
      Top = 304
      Width = 33
      Height = 13
      Caption = 'Turnos'
    end
    object btnAgregarTurno: TSpeedButton
      Left = 5
      Top = 344
      Width = 20
      Height = 25
      Cursor = crArrow
      Hint = 'Insertar Turno (Ctrl + I)'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        1010007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
        1000FF0000FF0000FF00002F2F10101010101010101010101010101010101010
        101000FFFF00FFFF00CFCF009090007F7F10101000FF0000FF00002F2F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
        90007F7F10101000FF00002F2F60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60
        FFFF60FFFF2FFFFF00FFFF00FFFF00CFCF009090007F7F101010002F2F90FFFF
        EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
        FF00CFCF007F7F002F2F002F2FCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCF
        FFFFCFFFFFCFFFFFEFF0FF2FFFFF00FFFF007F7F002F2F00FF00002F2F002F2F
        002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
        7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        2F2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAgregarTurnoClick
    end
    object btnEliminarTurno: TSpeedButton
      Left = 5
      Top = 376
      Width = 20
      Height = 25
      Cursor = crArrow
      Hint = 'Borrar Turno (Ctrl + D)'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        200000000000000400000000000000000000000000000000000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF000000FF00FF101010001010101000FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF0000101010FF007F7F101010107F00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF10101000007F7F1000CFCF7F101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF0000101010FF007F7F102FFFFF7F00CFCFFF101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF002F00FF
        000000FF00FF10101000007F7F102FFFFF7F2FFFFFFF00CFCFFF101010CF00FF
        001000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF002F00FF
        0000101010FF007F7F102FFFFF7FCFFFFFFF2FFFFFFF00CFCFFF101010CF1010
        10101010101010101010101010101010101010101010002F2F1000FF002F1010
        1000007F7F102FFFFF7FCFFFFFFFCFFFFFFF2FFFFFFF00CFCFFF007F7FCF007F
        7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F002F2F7F1010102F007F
        7F102FFFFF7FCFFFFFFFCFFFFFFFCFFFFFFF2FFFFFFF60FFFFFF60FFFFFF60FF
        FFFF60FFFFFF60FFFFFF60FFFFFF00CFCFFF009090CF002F2F90002F2F2F007F
        7F2F00CFCF7F00FFFFCFEFF0FFFFEFF0FFFFEFF0FFF0EFF0FFFFEFF0FFF0EFF0
        FFFFEFF0FFF0FFFFFFFF60FFFFFF00CFCFFF009090CF002F2F9000FF002F002F
        2F00007F7F2F00FFFF7F2FFFFFFFEFF0FFFFCFFFFFF0CFFFFFFFCFFFFFFFCFFF
        FFFFCFFFFFFFFFFFFFFF60FFFFFF00CFCFFF009090CF002F2F9000FF00FF00FF
        0000002F2FFF007F7F2F2FFFFF7FCFFFFFFF2FFFFFFF00CFCFFF002F2FCF002F
        2F2F002F2F2F002F2F2F002F2F2F002F2F2F002F2F2F002F2F2F00FF00FF00FF
        000000FF00FF002F2F00007F7F2FCFFFFF7F2FFFFFFF00CFCFFF002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF0000002F2FFF007F7F2F2FFFFF7F00CFCFFF002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF002F2F00007F7F2F00CFCF7F002F2FCF00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
        000000FF00FF00FF000000FF00FF00FF0000002F2FFF007F7F2F002F2F7F00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF000000FF
        000000FF00FF00FF000000FF00FF00FF000000FF00FF002F2F00002F2F2F00FF
        002F00FF00FF00FF000000FF00FF00FF000000FF00FF00FF0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEliminarTurnoClick
    end
    object Bevel1: TBevel
      Left = 267
      Top = 296
      Width = 1
      Height = 168
    end
    object Label4: TLabel
      Left = 275
      Top = 296
      Width = 121
      Height = 13
      Caption = 'Elementos de Contenci'#243'n'
    end
    object Bevel2: TBevel
      Left = 507
      Top = 296
      Width = 1
      Height = 165
    end
    object Label5: TLabel
      Left = 518
      Top = 382
      Width = 50
      Height = 13
      Caption = 'Acompa'#241'a'
    end
    object Label6: TLabel
      Left = 520
      Top = 418
      Width = 33
      Height = 13
      Caption = 'Espera'
    end
    object Bevel4: TBevel
      Left = -15
      Top = 26
      Width = 669
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label7: TLabel
      Left = 8
      Top = 7
      Width = 23
      Height = 13
      Caption = 'CUIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 134
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 376
      Top = 7
      Width = 41
      Height = 13
      Caption = 'Siniestro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 546
      Top = 7
      Width = 36
      Height = 13
      Caption = 'N'#186' Aut.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 594
      Top = 382
      Width = 39
      Height = 13
      Caption = 'Retorno'
    end
    object btnAnulacionTurno: TSpeedButton
      Left = 6
      Top = 408
      Width = 19
      Height = 25
      Cursor = crArrow
      Hint = 'Baja de turno (Ctrl + X)'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888808888888888088800088888888888880000888888
        8088888000888888088888880008888008888888800088008888888888000008
        8888888888800088888888888800000888888888800088008888888000088880
        0888880000888888008888000888888888088888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAnulacionTurnoClick
    end
    object lbKMExcedente: TLabel
      Left = 354
      Top = 398
      Width = 72
      Height = 13
      Cursor = crHelp
      Hint = 'Haga click aqu'#237' para ver informaci'#243'n adicional'
      Caption = 'Km. Excedente'
      ParentShowHint = False
      ShowHint = True
      OnClick = lbKMExcedenteClick
    end
    object lbKilometraje: TLabel
      Left = 274
      Top = 398
      Width = 53
      Height = 13
      Cursor = crHelp
      Hint = 'Haga click aqu'#237' para ver informaci'#243'n adicional'
      Caption = 'Kilometraje'
      ParentShowHint = False
      ShowHint = True
      OnClick = lbKilometrajeClick
    end
    object Label21: TLabel
      Left = 178
      Top = 304
      Width = 44
      Height = 13
      Caption = 'Retornos'
    end
    object lbKMBase: TLabel
      Left = 430
      Top = 398
      Width = 44
      Height = 13
      Cursor = crHelp
      Hint = 'Haga click aqu'#237' para ver informaci'#243'n adicional'
      Caption = 'Km. Base'
      ParentShowHint = False
      ShowHint = True
      OnClick = lbKMBaseClick
    end
    object btnSIC: TSpeedButton
      Left = 624
      Top = 2
      Width = 22
      Height = 20
      Hint = 'SIC - Agenda de Eventos'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFFFFF9FFFFFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEF6F3F1EEE5DD568ED10075E2007BE70079E720
        7AD8A5B8D3FCF3E8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBF9E3E0E0
        0C72D90F98FF3A9AF06BA9E55EA6E71090FD0F90F56896D1FFF9EEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF2C84E00E95FFA4C1DBF2EBD8EAEADFF1EFE2EA
        E2D12B8FEF0E8EF4C8D9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D9F20D8EF3
        76ADE2F3EEE0E8EBE9F1F4F33F3C37EEF3EFEBE2CF1090FC3289E0FFFFFEFFFF
        FAFFFFFAFFFFF9FFFFFF8CB6E9088BF9D8DBD9EBEEEAFFFFFF52534E9D9E9BF2
        F7F5E8E6D9539DE4198BEC136A9E1676B41575B21275B28EADC192BBEB007EF3
        EBE5D8EEF0EEFFFFFF4C4C483C3D37DADDDBF3F2E75998DA198CF0968A779B9A
        91A39F935D819581AFCD92B9EA118EF4B1C2D5F3F3ECF3F5F3FFFFFFD3D4D23D
        3C35BCB29F378FE72790ECFFFFFFB4B8B5A2A19C5D869E82AFCCFFFFFF0380E9
        277DD8F8EEDAF0F2ECECEFECEFF2EFFFFEF1A3B7CF1195FF618AB8BDB6AEEBEB
        EBD0CECA729BB280ADCAFFFFFF97BAE80F90F42375D2AEBCCBE9E1D2D5D4CE6A
        93C50987F33692E9A29588BBB9B8FBFBFBFFFFFF49728983B0CDFFFFFFFFFFFF
        91B6E8007BE8138DF1097EEA158AF20E8DF34594E4D4CBC69C9A95A8A7A5F5F4
        F5FFFFFF4C748B83B0CDFFFFFFFFFFFFFFFFFFFFFFFE8DB6EB3C84CB2767A4E4
        E9F6E1D8CCEBEBEAEDEDEDECEDEDC8CBCAFFFFFF4D748B83B0CDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7BAAC64C7080FFFFFF88908EC0C1BEFFFFFFC0C1BE8890
        8EFFFFFF4B718683B0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A9DBE629CC03D
        677FD2CFC9677E8845718A667D87D3D0CA3F698066A0C479A7C4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE8F1F5689CBD6AA2C5DAD5CF7693A170A8CB85A0AFCCC7
        C26BA3C6689CBDEDF3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC8CAC9FCFAF8FFFFFFFBF9F7C9CBCAFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = btnSICClick
    end
    object grpDesde: TGroupBox
      Left = 4
      Top = 68
      Width = 636
      Height = 111
      Caption = ' Desde     '
      Color = clBtnFace
      ParentColor = False
      TabOrder = 16
      DesignSize = (
        636
        111)
      inline fraDireccionDesde: TfraDomicilioGIS
        Left = 3
        Top = 44
        Width = 628
        Height = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 44
        ExplicitWidth = 628
        DesignSize = (
          628
          59)
        inherited lbCalle: TLabel
          Left = 22
          ExplicitLeft = 22
        end
        inherited lbNro: TLabel
          Left = 451
          ExplicitLeft = 451
        end
        inherited lbPiso: TLabel
          Left = 515
          ExplicitLeft = 515
        end
        inherited lbDto: TLabel
          Left = 567
          ExplicitLeft = 567
        end
        inherited lbCPostal: TLabel
          Left = 6
          ExplicitLeft = 6
        end
        inherited lbCPA: TLabel
          Left = 106
          ExplicitLeft = 106
        end
        inherited lbLocalidad: TLabel
          Left = 214
          ExplicitLeft = 214
        end
        inherited lbProvincia: TLabel
          Left = 471
          ExplicitLeft = 471
        end
        inherited cmbCalle: TArtComboBox
          Left = 50
          Width = 300
          ExplicitLeft = 50
          ExplicitWidth = 300
        end
        inherited edNumero: TEdit
          Left = 467
          ExplicitLeft = 467
        end
        inherited edPiso: TEdit
          Left = 539
          ExplicitLeft = 539
        end
        inherited edDto: TEdit
          Left = 591
          ExplicitLeft = 591
        end
        inherited edCPostal: TIntEdit
          Left = 50
          ExplicitLeft = 50
        end
        inherited cmbLocalidad: TArtComboBox
          Left = 264
          Width = 196
          ExplicitLeft = 264
          ExplicitWidth = 196
        end
        inherited edProvincia: TEdit
          Left = 519
          ExplicitLeft = 519
        end
        inherited edCPA: TPatternEdit
          Left = 130
          ExplicitLeft = 130
        end
        inherited btnBuscar: TButton
          Left = 167
          ExplicitLeft = 167
        end
        inherited btnBuscarGIS: TAdvGlowButton
          Left = 355
          ExplicitLeft = 355
        end
        inherited btnMapaGIS: TAdvGlowButton
          Left = 401
          ExplicitLeft = 401
        end
      end
      inline fraPrestadorDesde: TfraPrestador
        Left = 8
        Top = 20
        Width = 623
        Height = 26
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 8
        ExplicitTop = 20
        ExplicitWidth = 623
        ExplicitHeight = 26
        DesignSize = (
          623
          26)
        inherited lbCUIT: TLabel
          Left = 17
          ExplicitLeft = 17
        end
        inherited lbSec: TLabel
          Left = 135
          ExplicitLeft = 135
        end
        inherited lbIdentif: TLabel
          Left = 206
          ExplicitLeft = 206
        end
        inherited lbRSocial: TLabel
          Left = 290
          ExplicitLeft = 290
        end
        inherited lbCPostal: TLabel
          Left = 551
          ExplicitLeft = 551
        end
        inherited lbTelefono: TLabel
          Left = 463
          ExplicitLeft = 463
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 168
          ExplicitWidth = 168
        end
        inherited mskPrestCUIT: TMaskEdit
          Left = 45
          ExplicitLeft = 45
        end
        inherited cmbPrestador: TArtComboBox
          Left = 335
          Width = 290
          ExplicitLeft = 335
          ExplicitWidth = 290
        end
        inherited edPresLocalidad: TEdit
          Width = 197
          ExplicitWidth = 197
        end
        inherited edPresCPostal: TEdit
          Left = 568
          ExplicitLeft = 568
        end
        inherited edPrestIdentif: TIntEdit
          Left = 242
          ExplicitLeft = 242
        end
        inherited edPrestSecuencia: TIntEdit
          Left = 159
          ExplicitLeft = 159
        end
        inherited edPresTelefono: TEdit
          Left = 483
          ExplicitLeft = 483
        end
        inherited sdqDatos: TSDQuery
          Top = 36
        end
        inherited dsDatos: TDataSource
          Top = 36
        end
      end
    end
    object cmbTipoTraslado: TArtComboBox
      Left = 116
      Top = 32
      Width = 172
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentCtl3D = False
      TabOrder = 7
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsTipoTraslado
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbTipoTrasladoCloseUp
    end
    object cmbSolicitante: TArtComboBox
      Left = 376
      Top = 32
      Width = 180
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentCtl3D = False
      TabOrder = 9
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsSolicitante
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbSolicitanteCloseUp
    end
    object grpHasta: TGroupBox
      Left = 4
      Top = 188
      Width = 635
      Height = 107
      Caption = ' Hasta      '
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 19
      DesignSize = (
        635
        107)
      inline fraPrestadorHasta: TfraPrestador
        Left = 8
        Top = 19
        Width = 621
        Height = 27
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 8
        ExplicitTop = 19
        ExplicitWidth = 621
        ExplicitHeight = 27
        DesignSize = (
          621
          27)
        inherited lbCUIT: TLabel
          Left = 17
          ExplicitLeft = 17
        end
        inherited lbSec: TLabel
          Left = 135
          ExplicitLeft = 135
        end
        inherited lbIdentif: TLabel
          Left = 206
          ExplicitLeft = 206
        end
        inherited lbRSocial: TLabel
          Left = 291
          ExplicitLeft = 291
        end
        inherited lbCPostal: TLabel
          Left = 549
          ExplicitLeft = 549
        end
        inherited lbTelefono: TLabel
          Left = 461
          ExplicitLeft = 461
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 166
          ExplicitWidth = 166
        end
        inherited mskPrestCUIT: TMaskEdit
          Left = 45
          ExplicitLeft = 45
        end
        inherited cmbPrestador: TArtComboBox
          Left = 335
          Width = 288
          ExplicitLeft = 335
          ExplicitWidth = 288
        end
        inherited edPresLocalidad: TEdit
          Width = 195
          ExplicitWidth = 195
        end
        inherited edPresCPostal: TEdit
          Left = 566
          ExplicitLeft = 566
        end
        inherited edPrestIdentif: TIntEdit
          Left = 242
          ExplicitLeft = 242
        end
        inherited edPrestSecuencia: TIntEdit
          Left = 159
          ExplicitLeft = 159
        end
        inherited edPresTelefono: TEdit
          Left = 481
          ExplicitLeft = 481
        end
        inherited sdqDatos: TSDQuery
          Top = 28
        end
        inherited dsDatos: TDataSource
          Top = 28
        end
      end
      inline fraDireccionHasta: TfraDomicilioGIS
        Left = 3
        Top = 44
        Width = 625
        Height = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 44
        ExplicitWidth = 625
        DesignSize = (
          625
          59)
        inherited lbCalle: TLabel
          Left = 22
          ExplicitLeft = 22
        end
        inherited lbNro: TLabel
          Left = 448
          ExplicitLeft = 448
        end
        inherited lbPiso: TLabel
          Left = 512
          ExplicitLeft = 512
        end
        inherited lbDto: TLabel
          Left = 564
          ExplicitLeft = 564
        end
        inherited lbCPostal: TLabel
          Left = 6
          ExplicitLeft = 6
        end
        inherited lbCPA: TLabel
          Left = 106
          ExplicitLeft = 106
        end
        inherited lbLocalidad: TLabel
          Left = 214
          ExplicitLeft = 214
        end
        inherited lbProvincia: TLabel
          Left = 468
          ExplicitLeft = 468
        end
        inherited cmbCalle: TArtComboBox
          Left = 50
          Width = 297
          ExplicitLeft = 50
          ExplicitWidth = 297
        end
        inherited edNumero: TEdit
          Left = 464
          ExplicitLeft = 464
        end
        inherited edPiso: TEdit
          Left = 536
          ExplicitLeft = 536
        end
        inherited edDto: TEdit
          Left = 588
          ExplicitLeft = 588
        end
        inherited edCPostal: TIntEdit
          Left = 50
          ExplicitLeft = 50
        end
        inherited cmbLocalidad: TArtComboBox
          Left = 264
          Width = 193
          ExplicitLeft = 264
          ExplicitWidth = 193
        end
        inherited edProvincia: TEdit
          Left = 516
          ExplicitLeft = 516
        end
        inherited edCPA: TPatternEdit
          Left = 130
          ExplicitLeft = 130
        end
        inherited btnBuscar: TButton
          Left = 164
          ExplicitLeft = 164
        end
        inherited btnBuscarGIS: TAdvGlowButton
          Left = 352
          ExplicitLeft = 352
        end
        inherited btnMapaGIS: TAdvGlowButton
          Left = 398
          ExplicitLeft = 398
        end
      end
    end
    object cmbTurnoFecha: TDateComboBox
      Left = 42
      Top = 300
      Width = 88
      Height = 21
      TabOrder = 20
    end
    object mskTurnoHora: TMaskEdit
      Left = 133
      Top = 300
      Width = 38
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 21
      Text = '  :  '
    end
    object cmbElContencion1: TArtComboBox
      Left = 322
      Top = 315
      Width = 182
      Height = 19
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 25
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsElContencion1
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbElContencion1CloseUp
    end
    object cmbElContencion2: TArtComboBox
      Left = 322
      Top = 341
      Width = 182
      Height = 19
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 27
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsElContencion2
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbElContencion2CloseUp
    end
    object cmbElContencion3: TArtComboBox
      Left = 322
      Top = 367
      Width = 182
      Height = 19
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 29
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsElContencion3
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbElContencion3CloseUp
    end
    object cmbAcompaniante: TComboBox
      Left = 518
      Top = 395
      Width = 51
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 36
      Text = 'No'
      Items.Strings = (
        'S'#237
        'No')
    end
    object cmbEspera: TComboBox
      Left = 518
      Top = 431
      Width = 51
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 38
      Text = 'No'
      OnChange = cmbEsperaChange
      Items.Strings = (
        'S'#237
        'No')
    end
    object cmbDesde: TArtComboBox
      Left = 78
      Top = 64
      Width = 159
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 12
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsDesde
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbDesdeCloseUp
    end
    object cmbHasta: TArtComboBox
      Left = 78
      Top = 184
      Width = 161
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 18
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TB_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 70
          Visible = True
        end>
      DataSource = dsHasta
      FieldList = 'TB_DESCRIPCION'
      FieldKey = 'TB_CODIGO'
      OnCloseUp = cmbHastaCloseUp
    end
    object edElContencion1: TIntEdit
      Left = 274
      Top = 315
      Width = 47
      Height = 21
      TabOrder = 24
      OnExit = edElContencion1Exit
      OnKeyPress = edElContencion1KeyPress
    end
    object edElContencion2: TIntEdit
      Left = 274
      Top = 341
      Width = 47
      Height = 21
      TabOrder = 26
      OnExit = edElContencion2Exit
      OnKeyPress = edElContencion2KeyPress
    end
    object edElContencion3: TIntEdit
      Left = 274
      Top = 367
      Width = 47
      Height = 21
      TabOrder = 28
      OnExit = edElContencion3Exit
      OnKeyPress = edElContencion3KeyPress
    end
    object edCuil: TEdit
      Left = 36
      Top = 4
      Width = 92
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edNombre: TEdit
      Left = 176
      Top = 4
      Width = 194
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edSiniestro: TEdit
      Left = 420
      Top = 4
      Width = 62
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edOrden: TEdit
      Left = 480
      Top = 4
      Width = 30
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edRecaida: TEdit
      Left = 508
      Top = 4
      Width = 30
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edTipoTraslado: TEdit
      Left = 92
      Top = 32
      Width = 22
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 1
      ParentCtl3D = False
      TabOrder = 6
      OnExit = edTipoTrasladoExit
      OnKeyPress = edTipoTrasladoKeyPress
    end
    object edSolicitante: TEdit
      Left = 352
      Top = 32
      Width = 22
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 1
      ParentCtl3D = False
      TabOrder = 8
      OnExit = edSolicitanteExit
      OnKeyPress = edSolicitanteKeyPress
    end
    object edNumAuto: TEdit
      Left = 585
      Top = 3
      Width = 38
      Height = 19
      Color = clMenu
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object cmbRetorno: TComboBox
      Left = 594
      Top = 395
      Width = 47
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 37
      Text = 'No'
      OnChange = cmbRetornoChange
      Items.Strings = (
        'S'#237
        'No')
    end
    object edDesde: TEdit
      Left = 56
      Top = 64
      Width = 22
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 1
      ParentCtl3D = False
      TabOrder = 11
      OnExit = edDesdeExit
      OnKeyPress = edDesdeKeyPress
    end
    object edHasta: TEdit
      Left = 56
      Top = 184
      Width = 22
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 1
      ParentCtl3D = False
      TabOrder = 17
      OnExit = edHastaExit
      OnKeyPress = edHastaKeyPress
    end
    object gbVuelo: TGroupBox
      Left = 511
      Top = 295
      Width = 128
      Height = 84
      Caption = ' Vuelo '
      TabOrder = 35
      object Label12: TLabel
        Left = 4
        Top = 18
        Width = 38
        Height = 13
        Caption = 'Nro. ida'
      end
      object lbAproImporte: TLabel
        Left = 3
        Top = 61
        Width = 53
        Height = 13
        Caption = 'Tarifa total'
      end
      object Label13: TLabel
        Left = 4
        Top = 40
        Width = 54
        Height = 13
        Caption = 'Nro. vuelta'
      end
      object edTarifaVuelo: TCurrencyEdit
        Left = 60
        Top = 58
        Width = 62
        Height = 20
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        TabOrder = 2
      end
      object edVueloIda: TEdit
        Left = 60
        Top = 12
        Width = 62
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object edVueloVuelta: TEdit
        Left = 60
        Top = 35
        Width = 62
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
    end
    object sbTurnos: TScrollBox
      Left = 26
      Top = 324
      Width = 145
      Height = 186
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Anchors = [akLeft, akTop, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 22
      object lstTurnos: TListBox
        Left = 1
        Top = 0
        Width = 340
        Height = 349
        Style = lbOwnerDrawFixed
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 15
        MultiSelect = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnDrawItem = lstTurnosDrawItem
      end
    end
    object fpRetorno: TFormPanel
      Left = 257
      Top = 149
      Width = 215
      Height = 141
      Caption = 'Datos adicionales traslados'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      OnBeforeShow = fpRetornoBeforeShow
      DesignSize = (
        215
        141)
      object GroupBox2: TGroupBox
        Left = 4
        Top = 3
        Width = 207
        Height = 108
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        object Label19: TLabel
          Left = 18
          Top = 78
          Width = 68
          Height = 13
          Caption = 'Fecha retorno'
        end
        object Label17: TLabel
          Left = 18
          Top = 49
          Width = 58
          Height = 13
          Caption = 'Fecha turno'
        end
        object chkRetorno: TCheckBox
          Left = 16
          Top = 16
          Width = 77
          Height = 17
          Caption = '&Con retorno'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkRetornoClick
        end
        object dcFechaRetorno: TDateComboBox
          Left = 95
          Top = 74
          Width = 88
          Height = 21
          Color = clWhite
          TabOrder = 0
        end
        object dcFechaTurno: TDateComboBox
          Left = 95
          Top = 45
          Width = 88
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
      end
      object btnAceptarRetorno: TButton
        Left = 135
        Top = 115
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarRetornoClick
      end
    end
    object btnTrabajador: TAdvGlowButton
      Left = 562
      Top = 28
      Width = 79
      Height = 33
      Caption = 'Datos del Trabajador'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 10
      OnClick = btnTrabajadorClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object edKilometraje: TCurrencyEdit
      Left = 274
      Top = 412
      Width = 73
      Height = 21
      Hint = 
        'Kilometraje m'#225'ximo reconocido por el GIS entre la direcci'#243'n de o' +
        'rigen del traslado y la de destino'
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.0;- ,0.0'
      MaxLength = 11
      ParentShowHint = False
      ShowHint = True
      TabOrder = 30
    end
    object edKMExcedente: TCurrencyEdit
      Left = 354
      Top = 412
      Width = 73
      Height = 21
      Hint = 
        'Kilometraje excedente expl'#237'citamente autorizado por motivos ajen' +
        'os al GIS'
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.0;- ,0.0'
      MaxLength = 11
      ParentShowHint = False
      ShowHint = True
      TabOrder = 31
    end
    object chkExtension: TCheckBox
      Left = 274
      Top = 439
      Width = 224
      Height = 17
      Hint = 
        'Utilice esta opci'#243'n para indicar otra direcci'#243'n que generar'#225' una' +
        ' nueva autorizaci'#243'n'
      Caption = 'Autorizar la extensi'#243'n de esta autorizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 33
    end
    object fpExtension: TFormPanel
      Left = 659
      Top = 174
      Width = 649
      Height = 157
      Caption = 'Extensi'#243'n de la autorizaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      Position = poOwnerFormCenter
      object GroupBox3: TGroupBox
        Left = 8
        Top = 12
        Width = 636
        Height = 107
        Caption = 'Hasta      '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        DesignSize = (
          636
          107)
        inline fraPrestadorHasta2: TfraPrestador
          Left = 8
          Top = 19
          Width = 617
          Height = 27
          VertScrollBar.Range = 49
          VertScrollBar.Visible = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 19
          ExplicitWidth = 617
          ExplicitHeight = 27
          DesignSize = (
            617
            27)
          inherited lbCUIT: TLabel
            Left = 1
            ExplicitLeft = 1
          end
          inherited lbSec: TLabel
            Left = 135
            ExplicitLeft = 135
          end
          inherited lbIdentif: TLabel
            Left = 206
            ExplicitLeft = 206
          end
          inherited lbRSocial: TLabel
            Left = 291
            ExplicitLeft = 291
          end
          inherited lbCPostal: TLabel
            Left = 545
            ExplicitLeft = 545
          end
          inherited lbTelefono: TLabel
            Left = 457
            ExplicitLeft = 457
          end
          inherited cmbPrestFantasia: TArtComboBox
            Width = 162
            ExplicitWidth = 162
          end
          inherited mskPrestCUIT: TMaskEdit
            Left = 45
            ExplicitLeft = 45
          end
          inherited cmbPrestador: TArtComboBox
            Left = 332
            Width = 287
            ExplicitLeft = 332
            ExplicitWidth = 287
          end
          inherited edPresLocalidad: TEdit
            Width = 191
            ExplicitWidth = 191
          end
          inherited edPresCPostal: TEdit
            Left = 562
            ExplicitLeft = 562
          end
          inherited edPrestIdentif: TIntEdit
            Left = 242
            ExplicitLeft = 242
          end
          inherited edPrestSecuencia: TIntEdit
            Left = 159
            ExplicitLeft = 159
          end
          inherited edPresTelefono: TEdit
            Left = 477
            ExplicitLeft = 477
          end
          inherited sdqDatos: TSDQuery
            Top = 28
          end
          inherited dsDatos: TDataSource
            Top = 28
          end
        end
        inline fraDireccionHasta2: TfraDomicilioGIS
          Left = 3
          Top = 44
          Width = 625
          Height = 59
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitLeft = 3
          ExplicitTop = 44
          ExplicitWidth = 625
          DesignSize = (
            625
            59)
          inherited lbCalle: TLabel
            Left = 22
            ExplicitLeft = 22
          end
          inherited lbNro: TLabel
            Left = 448
            ExplicitLeft = 448
          end
          inherited lbPiso: TLabel
            Left = 512
            ExplicitLeft = 512
          end
          inherited lbDto: TLabel
            Left = 564
            ExplicitLeft = 564
          end
          inherited lbCPostal: TLabel
            Left = 6
            ExplicitLeft = 6
          end
          inherited lbCPA: TLabel
            Left = 106
            ExplicitLeft = 106
          end
          inherited lbLocalidad: TLabel
            Left = 214
            ExplicitLeft = 214
          end
          inherited lbProvincia: TLabel
            Left = 468
            ExplicitLeft = 468
          end
          inherited cmbCalle: TArtComboBox
            Left = 50
            Width = 297
            ExplicitLeft = 50
            ExplicitWidth = 297
          end
          inherited edNumero: TEdit
            Left = 464
            ExplicitLeft = 464
          end
          inherited edPiso: TEdit
            Left = 536
            ExplicitLeft = 536
          end
          inherited edDto: TEdit
            Left = 588
            ExplicitLeft = 588
          end
          inherited edCPostal: TIntEdit
            Left = 50
            ExplicitLeft = 50
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 264
            Width = 193
            ExplicitLeft = 264
            ExplicitWidth = 193
          end
          inherited edProvincia: TEdit
            Left = 516
            ExplicitLeft = 516
          end
          inherited edCPA: TPatternEdit
            Left = 130
            ExplicitLeft = 130
          end
          inherited btnBuscar: TButton
            Left = 164
            ExplicitLeft = 164
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 352
            ExplicitLeft = 352
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 398
            ExplicitLeft = 398
          end
        end
      end
      object edHasta2: TEdit
        Left = 61
        Top = 8
        Width = 22
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 0
        OnExit = edHasta2Exit
        OnKeyPress = edHasta2KeyPress
      end
      object cmbHasta2: TArtComboBox
        Left = 83
        Top = 8
        Width = 161
        Height = 21
        CharCase = ecUpperCase
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 1
        Columns = <
          item
            Expanded = False
            FieldName = 'TB_CODIGO'
            Title.Caption = 'C'#243'd.'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 70
            Visible = True
          end>
        DataSource = dsHasta2
        FieldList = 'TB_DESCRIPCION'
        FieldKey = 'TB_CODIGO'
        OnCloseUp = cmbHasta2CloseUp
      end
      object pnlBottomExtension: TPanel
        Left = 0
        Top = 128
        Width = 649
        Height = 29
        Align = alBottom
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          649
          29)
        object btnCancelarExtension: TAdvGlowButton
          Left = 578
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Cancelar'
          ModalResult = 2
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Spacing = 4
          TabOrder = 1
          TabStop = True
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
        object btnAceptarExtension: TAdvGlowButton
          Left = 510
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          Spacing = 4
          TabOrder = 0
          TabStop = True
          OnClick = btnAceptarExtensionClick
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
      end
    end
    object sbRetornos: TScrollBox
      Left = 175
      Top = 324
      Width = 87
      Height = 186
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Anchors = [akLeft, akTop, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 23
      object lstRetornos: TListBox
        Left = 0
        Top = 0
        Width = 340
        Height = 238
        Style = lbOwnerDrawFixed
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        MultiSelect = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnDrawItem = lstRetornosDrawItem
      end
    end
    inline fraBaseRemiseria: TfraCodDesc
      Left = 347
      Top = 63
      Width = 249
      Height = 23
      TabOrder = 13
      ExplicitLeft = 347
      ExplicitTop = 63
      ExplicitWidth = 249
      DesignSize = (
        249
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 220
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DOMICILIO'
            Title.Caption = 'Domicilio'
            Width = 300
            Visible = True
          end>
        ExplicitLeft = 28
        ExplicitWidth = 220
      end
      inherited edCodigo: TPatternEdit
        Width = 25
        ExplicitWidth = 25
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = 
          ', art.utiles.armar_domicilio (br_calle, br_numero, br_piso, br_d' +
          'epartamento, br_localidad) as domicilio, br_calle, br_numero, br' +
          '_piso, br_departamento, br_cpostal, br_cpostala, br_localidad, b' +
          'r_provincia, br_lat, br_lng'
        FieldBaja = 'br_fechabaja'
        FieldCodigo = 'br_id'
        FieldDesc = 'br_localidad'
        FieldID = 'br_id'
        IdType = ctInteger
        OrderBy = 
          'art.utiles.armar_domicilio (br_calle, br_numero, br_piso, br_dep' +
          'artamento, br_localidad)'
        ShowBajas = True
        TableName = 'amed.mbr_baseremis'
        OnChange = fraBaseRemiseriaPropiedadesChange
      end
    end
    object pnlBaseRemiseria: TPanel
      Left = 237
      Top = 64
      Width = 110
      Height = 20
      BevelInner = bvLowered
      Caption = 'Base de la remiser'#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object btnMapaBaseRemiseria: TAdvGlowButton
      Left = 596
      Top = 64
      Width = 41
      Height = 21
      Hint = 
        'Ver informaci'#243'n detallada acerca de la ubicaci'#243'n de esta remiser' +
        #237'a'
      Caption = 'Mapa'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btnMapaBaseRemiseriaClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Enabled = False
    end
    object edKMBase: TCurrencyEdit
      Left = 430
      Top = 412
      Width = 73
      Height = 21
      Hint = 
        'Kilometraje m'#225'ximo adicional reconocido por el GIS entre la dire' +
        'cci'#243'n de origen del traslado y la base de la remiser'#237'a'
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.0;- ,0.0'
      MaxLength = 11
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
    end
    object pnlViajeCompartido: TPanel
      Left = 568
      Top = 416
      Width = 73
      Height = 37
      BevelOuter = bvNone
      TabOrder = 41
      Visible = False
      object Label16: TLabel
        Left = 2
        Top = 2
        Width = 70
        Height = 11
        Caption = 'Viaje compartido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnViajeCompartido: TAdvGlowButton
        Left = 2
        Top = 15
        Width = 70
        Height = 20
        Caption = 'Ver detalle'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        WordWrap = False
        TabOrder = 0
        TabStop = True
        OnClick = btnViajeCompartidoClick
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
      end
    end
    object pnlTildesViaje: TPanel
      Left = 274
      Top = 456
      Width = 159
      Height = 54
      BevelOuter = bvNone
      TabOrder = 34
      object chkNocturno: TCheckBox
        Left = 0
        Top = 17
        Width = 159
        Height = 17
        Hint = 
          'Utilice esta opci'#243'n para indicar cuando el paciente viaja despu'#233 +
          's de cierto horario'
        Align = alTop
        Caption = 'Viaje Nocturno'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chkFinDeSemana: TCheckBox
        Left = 0
        Top = 34
        Width = 159
        Height = 17
        Hint = 
          'Utilice esta opci'#243'n para indicar cuando el traslado se realiza e' +
          'n d'#237'a no h'#225'bil (feriados o fines de semana)'
        Align = alTop
        Caption = 'Viaje en d'#237'a no h'#225'bil'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object chkExclusivo: TCheckBox
        Left = 0
        Top = 0
        Width = 159
        Height = 17
        Hint = 
          'Utilice esta opci'#243'n para indicar que el paciente viaja solo (cua' +
          'ndo no se permite que sea compartido el viaje)'
        Align = alTop
        Caption = 'Viaje Exclusivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object fpPlataforma10: TFormPanel
    Left = 696
    Top = 261
    Width = 335
    Height = 136
    Caption = 'Datos adicionales Plataforma 10'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpPlataforma10BeforeShow
    DesignSize = (
      335
      136)
    object GroupBox1: TGroupBox
      Left = 4
      Top = 3
      Width = 327
      Height = 98
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        327
        98)
      object Label14: TLabel
        Left = 28
        Top = 40
        Width = 85
        Height = 13
        Caption = 'Nombre y apellido'
      end
      object Label15: TLabel
        Left = 93
        Top = 68
        Width = 18
        Height = 13
        Caption = 'DNI'
      end
      object chkAcomp: TCheckBox
        Left = 8
        Top = 16
        Width = 89
        Height = 17
        Caption = 'A&compa'#241'ante'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkAcompClick
      end
      object edNombreAcomp: TEdit
        Left = 119
        Top = 36
        Width = 202
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 60
        TabOrder = 0
      end
      object edDNIAcomp: TEdit
        Left = 119
        Top = 62
        Width = 90
        Height = 21
        Color = clWhite
        MaxLength = 8
        TabOrder = 1
      end
    end
    object btnAceptarPlataf: TButton
      Left = 255
      Top = 107
      Width = 75
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarPlatafClick
    end
  end
  object fpAnular: TFormPanel
    Left = 655
    Top = 412
    Width = 336
    Height = 75
    Caption = 'Ingrese motivo de anulaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpAnularBeforeShow
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    DesignSize = (
      336
      75)
    object Bevel5: TBevel
      Left = -69
      Top = 37
      Width = 402
      Height = 3
      Anchors = [akRight, akBottom]
      Shape = bsBottomLine
    end
    object Label18: TLabel
      Left = 4
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAnuAceptar: TButton
      Left = 186
      Top = 45
      Width = 70
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAnuAceptarClick
    end
    object btnAnuCancelar: TButton
      Left = 261
      Top = 45
      Width = 70
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraMotivoAnulacion: TfraCodigoDescripcion
      Left = 40
      Top = 8
      Width = 294
      Height = 23
      TabOrder = 0
      ExplicitLeft = 40
      ExplicitTop = 8
      ExplicitWidth = 294
      DesignSize = (
        294
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 244
        DataSource = nil
        ExplicitLeft = 48
        ExplicitWidth = 244
      end
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 518
    Width = 678
    Height = 29
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      678
      29)
    object ImagenGIF: TJvGIFAnimator
      Left = 2
      Top = 4
      Width = 674
      Height = 23
      AsyncDrawing = True
      AutoSize = False
      Center = True
      Image.Data = {
        66040000474946383961B4000C00A20000CCCCCCFFFFFF999999FFAA00000000
        00000000000000000021FF0B4E45545343415045322E30030100000021F90404
        0A0000002C00000000B4000C000003B428BADCFE30CA49ABBD386B39FA0881F7
        05400980E6499A28BB962DFCAA694CBBF56CEF7A9FFFB8A00C3814DE8A488042
        0462FA8C3CE2711A853E9355EC95BACD72A5B6A5A739EE9AC1672B7AAD6E6BD9
        6FF754DC21D7D3F1FC57EEEDE3F77A7E7073024E4E83827C7F89818B8E887F74
        23878A909695988D979A994A8565949CA280A48CA58F9DA65E9276239BA7AFAA
        A8A3B2B133AC2165B6BBA9B3B0BDBC49B8A1BFB4BEB5C0C9C6521BCDCECFD0D1
        D2D302090021F904040A0000002C0100010016000A00000329080A11CB61C8D1
        E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB332
        4B020021F904040A0000002C0D00010016000A00000329080A11CB61C8D1E678
        0DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B02
        0021F904040A0000002C1900010016000A00000329080A11CB61C8D1E6780DC7
        59A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021
        F904040A0000002C2500010016000A00000329080A11CB61C8D1E6780DC759A7
        D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904
        040A0000002C3100010016000A00000329080A11CB61C8D1E6780DC759A7D656
        277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A
        0000002C3D00010016000A00000329080A11CB61C8D1E6780DC759A7D656277D
        8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000
        002C4900010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B48
        6D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C
        5500010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63
        E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6100
        010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8
        217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6D000100
        16000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217A
        A920E7928A69D2506BE1F60CB3324B020021F904040A0000002C790001001600
        0A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920
        E7928A69D2506BE1F60CB3324B020021F904040A0000002C8500010016000A00
        000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E792
        8A69D2506BE1F60CB3324B020021F904040A0000002C9100010016000A000003
        29080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69
        D2506BE1F60CB3324B020021F904040A0000002C9D00010016000A0000032908
        0A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D250
        6BE1F60CB3324B02003B}
      Align = alBottom
      Visible = False
      ExplicitWidth = 665
    end
    object btnCancelar: TAdvGlowButton
      Left = 608
      Top = 2
      Width = 68
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      TabOrder = 1
      TabStop = True
      OnClick = btnCancelarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnAceptar: TAdvGlowButton
      Left = 540
      Top = 2
      Width = 68
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Spacing = 4
      TabOrder = 0
      TabStop = True
      OnClick = btnAceptarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object pnlGIS: TPanel
    Left = 652
    Top = 32
    Width = 17
    Height = 21
    Caption = 'pnlGIS'
    Color = clGreen
    TabOrder = 4
    Visible = False
  end
  object pnlGISBaseRemiseria: TFormPanel
    Left = 659
    Top = 76
    Width = 625
    Height = 89
    Caption = 'Direcci'#243'n de la Base de la Remiser'#237'a'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      625
      89)
    inline fraDomicilioBaseRemis: TfraDomicilioGIS
      Left = 0
      Top = 0
      Width = 625
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 625
      ExplicitHeight = 56
      DesignSize = (
        625
        56)
      inherited lbNro: TLabel
        Left = 448
        ExplicitLeft = 448
      end
      inherited lbPiso: TLabel
        Left = 512
        ExplicitLeft = 512
      end
      inherited lbDto: TLabel
        Left = 564
        ExplicitLeft = 564
      end
      inherited lbProvincia: TLabel
        Left = 468
        ExplicitLeft = 468
      end
      inherited cmbCalle: TArtComboBox
        Width = 297
        ExplicitWidth = 297
      end
      inherited edNumero: TEdit
        Left = 464
        ExplicitLeft = 464
      end
      inherited edPiso: TEdit
        Left = 536
        ExplicitLeft = 536
      end
      inherited edDto: TEdit
        Left = 588
        ExplicitLeft = 588
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 193
        ExplicitWidth = 193
      end
      inherited edProvincia: TEdit
        Left = 516
        ExplicitLeft = 516
      end
      inherited btnBuscar: TButton
        Left = 208
        ExplicitLeft = 208
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 352
        ExplicitLeft = 352
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 398
        ExplicitLeft = 398
      end
    end
    object btnCerrar: TButton
      Left = 544
      Top = 60
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object AdvToolPanelTabLateral: TAdvToolPanelTab
    Left = 655
    Top = 0
    Width = 23
    Height = 518
    AutoOpenCloseSpeed = aocVeryFast
    Color = clWhite
    ColorTo = 15527920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Position = ppRight
    SlideSpeed = ssFast
    Style = esOffice2003Classic
    TabColor = clWhite
    TabColorTo = 13226453
    TabHoverColor = 13811126
    TabHoverColorTo = 13811126
    Version = '1.5.4.2'
    OnTabSlideOutDone = BuscarDomicilios
    OnTabSlideInDone = AdvToolPanelTabLateralTabSlideInDone
    object AdvToolPanelGIS: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 992
      AllowDocking = False
      AutoLock = True
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 13811126
      HoverButtonColorTo = 13811126
      DownButtonColor = 11899525
      DownButtonColorTo = 11899525
      CaptionButton = False
      Color = 15198191
      ColorTo = 13029070
      GradientDirection = gdVertical
      DockDots = False
      CanSize = False
      Caption = 'GIS - Mapas'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = clBlack
      FocusCaptionColor = 14671839
      FocusCaptionColorTo = 11511715
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15724527
      NoFocusCaptionColorTo = 12634569
      OpenWidth = 664
      CloseHint = 'Close panel'
      LockHint = 'Fijar mapa'
      UnlockHint = 'Ocultar mapa'
      Sections = <>
      SectionLayout.CaptionColor = 15198183
      SectionLayout.CaptionColorTo = 14606046
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRectangle
      SectionLayout.BackGroundColor = 16250871
      SectionLayout.BackGroundColorTo = 15527920
      SectionLayout.BorderColor = clWhite
      SectionLayout.BorderWidth = 1
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlue
      SectionLayout.ItemHoverTextColor = clBlue
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      Style = esOffice2003Classic
      Version = '1.5.4.2'
    end
  end
  object sdqHasta2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      '  FROM ART.CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'TRASD'#39
      '   AND TB_CODIGO <> '#39'0'#39)
    Left = 552
    Top = 424
  end
  object dsHasta2: TDataSource
    DataSet = sdqHasta2
    Left = 580
    Top = 424
  end
  object sdqTipoTraslado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      'FROM    CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TRAST'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Left = 164
    Top = 28
  end
  object dsTipoTraslado: TDataSource
    DataSet = sdqTipoTraslado
    Left = 192
    Top = 28
  end
  object sdqSolicitante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      'FROM     CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'TRASS'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Left = 452
    Top = 28
  end
  object dsSolicitante: TDataSource
    DataSet = sdqSolicitante
    Left = 480
    Top = 28
  end
  object sdqDesde: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      'FROM     CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'TRASD'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Left = 248
    Top = 28
  end
  object dsDesde: TDataSource
    DataSet = sdqDesde
    Left = 276
    Top = 28
  end
  object sdqHasta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      'FROM     CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'TRASD'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Left = 116
    Top = 192
  end
  object dsHasta: TDataSource
    DataSet = sdqHasta
    Left = 144
    Top = 192
  end
  object sdqElContencion1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'SUBPR'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 358
    Top = 311
  end
  object dsElContencion1: TDataSource
    DataSet = sdqElContencion1
    Left = 386
    Top = 311
  end
  object sdqElContencion2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'SUBPR'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 358
    Top = 339
  end
  object dsElContencion2: TDataSource
    DataSet = sdqElContencion2
    Left = 386
    Top = 339
  end
  object sdqElContencion3: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'SUBPR'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 358
    Top = 367
  end
  object dsElContencion3: TDataSource
    DataSet = sdqElContencion3
    Left = 386
    Top = 367
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16457
        LinkControl = btnAgregarTurno
      end
      item
        Key = 16452
        LinkControl = btnEliminarTurno
      end
      item
        Key = 16472
        LinkControl = btnAnulacionTurno
      end>
    Left = 224
    Top = 388
  end
  object sdqDomicilios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO,TB_DESCRIPCION '
      'FROM    CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TRAST'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Left = 68
    Top = 356
  end
  object sdqTrasladosDomicPrest: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 96
    Top = 384
  end
  object sdqTrasladosSTR: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 96
    Top = 356
  end
  object sdqTrasladosSAU: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 68
    Top = 384
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'ManejoCompletoGIS'
      end
      item
        Name = 'MesaDeTraslados'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 168
    Top = 388
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 196
    Top = 388
  end
  object sdqZonas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT zo.zp_idprestador,'
      '       zo.zp_descripcion origen,'
      '       zd.zp_descripcion destino,'
      '       zv_nomenclador,'
      '       zv_capitulo,'
      '       zv_codigo,'
      
        '       (SELECT art.amebpba.get_val_prestacion(zv_idprestador, zv' +
        '_nomenclador, zv_capitulo, zv_codigo, au_siniestro, au_orden,'
      
        '                                              au_recaida, au_fec' +
        'hasoli, au_id, NULL, (:distanciatotal * :desvio) + NVL(:excedent' +
        'e, 0), :retorno)'
      '          FROM art.sau_autorizaciones'
      '         WHERE au_id = :idauto) AS importe'
      '  FROM art.szv_zonavalor,'
      '       art.szd_zonaprestadordetalle zdo,'
      '       art.szd_zonaprestadordetalle zdd,'
      '       art.szp_zonaprestador zo,'
      '       art.szp_zonaprestador zd'
      ' WHERE zv_idzonaorigen = zdo.zd_idzonaprestador'
      '   AND zv_idzonadestino = zdd.zd_idzonaprestador'
      '   AND zv_fechabaja IS NULL'
      '   AND zdo.zd_fechabaja IS NULL'
      '   AND zdd.zd_fechabaja IS NULL'
      '   AND zo.zp_fechabaja IS NULL'
      '   AND zd.zp_fechabaja IS NULL'
      '   AND zdo.zd_idzonaprestador = zo.zp_id'
      '   AND zdd.zd_idzonaprestador = zd.zp_id'
      '   AND zo.zp_idprestador = zd.zp_idprestador'
      '   AND zdo.zd_idprestador = zdd.zd_idprestador'
      '   AND zv_idprestador = :idprestador'
      '   AND zdo.zd_cpostal = :cpostal_origen'
      '   AND zdo.zd_localidad = :localidad_origen'
      '   AND zdo.zd_provincia = :provincia_origen'
      '   AND zdd.zd_cpostal = :cpostal_destino'
      '   AND zdd.zd_localidad = :localidad_destino'
      '   AND zdd.zd_provincia = :provincia_destino')
    Left = 196
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'distanciatotal'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'desvio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'excedente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'retorno'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idauto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cpostal_origen'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'localidad_origen'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'provincia_origen'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cpostal_destino'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'localidad_destino'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'provincia_destino'
        ParamType = ptInput
      end>
  end
end
