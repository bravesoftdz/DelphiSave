object frmManPrestador: TfrmManPrestador
  Left = 388
  Top = 154
  Caption = 'Mantenimiento de Prestadores'
  ClientHeight = 533
  ClientWidth = 772
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 780
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbPrestador: TGroupBox
    Left = 0
    Top = 0
    Width = 772
    Height = 69
    Align = alTop
    Caption = 'Prestador'
    TabOrder = 0
    DesignSize = (
      772
      69)
    inline fraPrestadorSel: TfraPrestador
      Left = 3
      Top = 15
      Width = 682
      Height = 49
      VertScrollBar.Range = 49
      VertScrollBar.Visible = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 15
      ExplicitWidth = 682
      ExplicitHeight = 49
      DesignSize = (
        682
        49)
      inherited lbCPostal: TLabel
        Left = 603
        ExplicitLeft = 636
      end
      inherited lbTelefono: TLabel
        Left = 427
        ExplicitLeft = 460
      end
      inherited edPresLocalidad: TEdit [8]
        Width = 228
        ExplicitWidth = 228
      end
      inherited edPresCPostal: TEdit [9]
        Left = 627
        ExplicitLeft = 627
      end
      inherited edPrestIdentif: TIntEdit [10]
        Left = 233
        ExplicitLeft = 233
      end
      inherited edPrestSecuencia: TIntEdit [11]
      end
      inherited edPresTelefono: TEdit [12]
        Left = 447
        ExplicitLeft = 447
      end
      inherited cmbPrestFantasia: TArtComboBox [13]
        Width = 615
        ExplicitWidth = 615
      end
      inherited edPresDomicilio: TEdit [14]
      end
      inherited cmbPrestador: TArtComboBox [15]
        Width = 352
        Columns = <
          item
            Expanded = False
            FieldName = 'CA_CLAVE'
            Title.Caption = 'CUIT'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_SECUENCIA'
            Title.Caption = 'Secuencia'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_IDENTIFICADOR'
            Title.Caption = 'Id.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_DESCRIPCION'
            Title.Caption = 'Raz'#243'n Social'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_NOMBREFANTA'
            Title.Caption = 'Nombre Fantas'#237'a'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA_LOCALIDAD'
            Title.Caption = 'Localidad'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Title.Caption = 'Provincia'
            Width = 120
            Visible = True
          end>
        ExplicitWidth = 352
      end
      inherited mskPrestCUIT: TMaskEdit [16]
      end
      inherited sdqDatos: TSDQuery
        Left = 328
        Top = 20
      end
      inherited dsDatos: TDataSource
        Left = 360
        Top = 8
      end
    end
    object rgEstadoPrest: TRadioGroup
      Left = 684
      Top = 0
      Width = 85
      Height = 64
      Anchors = [akTop, akRight]
      ItemIndex = 0
      Items.Strings = (
        'Activo'
        'No Activo'
        'Todos')
      TabOrder = 1
      OnClick = rgEstadoPrestClick
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 69
    Width = 772
    Height = 28
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 752
      end
      item
        Break = False
        Control = pnlAccion
        HorizontalOnly = True
        ImageIndex = -1
        MinHeight = 24
        Visible = False
        Width = 10
      end
      item
        Control = Button1
        ImageIndex = -1
        Width = 766
      end>
    object ToolBar: TToolBar
      Left = 11
      Top = 1
      Width = 739
      Height = 22
      Align = alNone
      Caption = 'ToolBar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbAgregar: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl + N)'
        Caption = '&Agregar'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAgregarClick
      end
      object tbModificar: TToolButton
        Tag = 2
        Left = 23
        Top = 0
        Hint = 'Modificar (Ctrl + O)'
        Caption = '&Modificar'
        Enabled = False
        ImageIndex = 24
        ParentShowHint = False
        ShowHint = True
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Tag = 3
        Left = 46
        Top = 0
        Hint = 'Eliminar (Ctrl + E)'
        Caption = '&Eliminar'
        Enabled = False
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEliminarClick
      end
      object SEP1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'SEP1'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Limpiar (Ctrl + L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        OnClick = tbLimpiarClick
      end
      object SEP2: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'SEP2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 108
        Top = 0
        Hint = 'Imprimir (Ctrl + I)'
        Caption = '&Listado'
        Enabled = False
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImprimirClick
      end
      object tbImportar: TToolButton
        Left = 131
        Top = 0
        Hint = 'Importar lista de'#13#10'Prestadores Asociados'
        Caption = 'tbImportar'
        ImageIndex = 21
        OnClick = tbImportarClick
      end
      object SEP4: TToolButton
        Left = 154
        Top = 0
        Width = 5
        Caption = 'SEP4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbCuentasBancarias: TToolButton
        Left = 159
        Top = 0
        Hint = 'Cuentas Bancarias (Ctrl + U)'
        Caption = 'tbCuentasBancarias'
        ImageIndex = 34
        OnClick = tbCuentasBancariasClick
      end
      object tbPoliza: TToolButton
        Left = 182
        Top = 0
        Hint = 'Ver p'#243'liza de seguros'
        ImageIndex = 6
        OnClick = tbPolizaClick
      end
      object tbRegiones: TToolButton
        Left = 205
        Top = 0
        Hint = 'Regiones Sanitarias'
        Enabled = False
        ImageIndex = 42
        OnClick = tbRegionesClick
      end
      object tbMediosTransporte: TToolButton
        Left = 228
        Top = 0
        Hint = 'Medios de transporte (combi)'
        Caption = 'Medios de transporte (combi)'
        ImageIndex = 30
        OnClick = tbMediosTransporteClick
      end
      object tbSIC: TToolButton
        Left = 251
        Top = 0
        Hint = 'Sistema Integrado de Comunicaciones'
        ImageIndex = 38
        OnClick = tbSICClick
      end
      object SEP3: TToolButton
        Left = 274
        Top = 0
        Width = 8
        Caption = 'SEP3'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbAuditable: TToolButton
        Left = 282
        Top = 0
        Hint = 'Alcance AMF (Ctrl + A)'
        Caption = 'tbAuditable'
        ImageIndex = 13
        OnClick = tbAuditableClick
      end
      object tbNoAuditable: TToolButton
        Left = 305
        Top = 0
        Hint = 'No Alcance AMF (Ctrl + D)'
        Caption = 'tbNoAuditable'
        ImageIndex = 2
        OnClick = tbNoAuditableClick
      end
      object ToolButton7: TToolButton
        Left = 328
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbVerHistoricoBajas: TToolButton
        Left = 336
        Top = 0
        Hint = 'Ver hist'#243'rico de bajas'
        ImageIndex = 14
        OnClick = tbVerHistoricoBajasClick
      end
      object ToolButton22: TToolButton
        Left = 359
        Top = 0
        Width = 8
        Caption = 'ToolButton22'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbObservLiquidaciones: TToolButton
        Left = 367
        Top = 0
        Hint = 'Observaciones de Liquidaciones'
        Caption = 'tbObservLiquidaciones'
        Enabled = False
        ImageIndex = 49
        OnClick = tbObservLiquidacionesClick
      end
      object ToolButton23: TToolButton
        Left = 390
        Top = 0
        Width = 8
        Caption = 'ToolButton23'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbConsultorio: TToolButton
        Left = 398
        Top = 0
        Hint = 'Consultorio'
        Caption = '&Salir'
        Enabled = False
        ImageIndex = 44
        ParentShowHint = False
        ShowHint = True
        OnClick = tbConsultorioClick
      end
      object tbUsuariosPorGrupo: TToolButton
        Left = 421
        Top = 0
        Hint = 'Usuarios por grupo'
        Caption = 'Usuarios por grupo'
        ImageIndex = 46
        OnClick = tbUsuariosPorGrupoClick
      end
      object ToolButton26: TToolButton
        Left = 444
        Top = 0
        Width = 8
        Caption = 'ToolButton26'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 452
        Top = 0
        Hint = 'Salir (Ctrl + S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
    object pnlAccion: TPanel
      Left = 767
      Top = 0
      Width = 1
      Height = 24
      BevelOuter = bvNone
      Caption = 'Inactivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object Button1: TButton
      Left = 11
      Top = 26
      Width = 757
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
    end
  end
  object pnlPie: TPanel
    Left = 0
    Top = 503
    Width = 772
    Height = 30
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 5
    DesignSize = (
      772
      30)
    object btnCancelar: TBitBtn
      Left = 616
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      Glyph.Data = {
        5E080000424D5E08000000000000360000002800000026000000120000000100
        18000000000028080000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000C0C0C00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF00000000FF0000FF003333CC0000FF00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FF00FF0000FF008686868686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF004D4D4D
        000000FF0000FF003333CC0066FF0000FF00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00868686CCCCCC8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF003333CC33
        99FF0066FF0000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF000000FF00FF0000FF0000FF00868686FFFFFFCCCCCC8686
        8633333300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF004D4D4D00FF00000000FF0000FF0000FF003333CC3399FF0000FF00009900
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FF00
        00FF0000FF0000FF0000FF00868686FFFFFFCCCCCC33333300FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0086868600FF0000FF00000000FF
        0000FF0000FF0000FF000000CC3399FF0000CC00009900FF0000FF0000FF0000
        FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000FF00
        00FF00868686FFFFFF86868633333300FF0000FF0000FF0000FF0000FF0000FF
        0000FF008686860C0C0C00FF0000FF00000000FF0000FF0000FF0000FF0000FF
        000000CC0066FF00009900FF0000FF0000FF0000FF0000FF0000FF000000FF00
        009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00868686CCCCCC
        33333300FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF0000FF0000FF0000FF0000FF000000CC0000FF0000
        9900FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C0C00FF0000FF00
        00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000CC0000FF00009900FF0000FF000000
        FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF008686868686860C0C0C00FF0000FF008686860C0C0C00FF00
        00FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF000000CC0000FF0000990000FF00009900FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086
        86868686860C0C0C8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF00
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000CC
        0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086868686868633333300
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF000000CC0000FF0000990000CC00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF008686868686860C0C0C8686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00CC0000FF00009900FF0000FF000000CC00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C
        0C00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF0000FF00000000FF
        0000FF0000FF0000FF0000FF000000CC0000CC0000FF00009900FF0000FF0000
        FF0000FF000000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF008686868686868686860C0C0C00FF0000FF0000FF0000FF008686
        860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF0000FF000000CC0000
        CC3399FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF000000CC00
        009900FF0000FF0000FF0000FF0000FF0000FF00868686868686CCCCCC868686
        0C0C0C00FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF000000CC3399FF0066FF0000FF00009900FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF000000CC00009900FF0000FF0000
        FF0000FF00868686FFFFFFCCCCCC8686860C0C0C00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF008686860C0C0C00FF0000FF00000000FF000000CC
        3399FF0066FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF000000CC00FF0000FF00868686FFFFFFCCCCCC86
        86860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF004D4D4D00FF00000000FF006666990000CC0000CC66669900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868686868686868600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnGuardar: TBitBtn
      Left = 695
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
        0000AAA88888888888888A000000A8888800000088880A777778888887777800
        0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
        FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
        7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
        FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
        FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
        9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
        F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
        8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
        FFF778016E02AA88888888888888AAA77777777777777A006701}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnGuardarClick
    end
  end
  object pcDatos: TPageControl
    Left = 0
    Top = 97
    Width = 772
    Height = 406
    Hint = 'Filtrar Vigencia'
    ActivePage = tsNomenclador
    Align = alClient
    TabOrder = 2
    OnChange = pcDatosChange
    object tsDatosGrales: TTabSheet
      Caption = 'Datos generales'
      DesignSize = (
        764
        378)
      object lbCUIT: TLabel
        Left = 1
        Top = 9
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lbSecuencia: TLabel
        Left = 169
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Secuencia'
      end
      object lbIdentificar: TLabel
        Left = 262
        Top = 9
        Width = 61
        Height = 13
        Caption = 'Identificador'
      end
      object lbCodMutual: TLabel
        Left = 383
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Cod.Mutual'
      end
      object lbNomFantasia: TLabel
        Left = 1
        Top = 63
        Width = 69
        Height = 13
        Caption = 'Nom. Fantas'#237'a'
      end
      object lbRSocial: TLabel
        Left = 1
        Top = 36
        Width = 60
        Height = 13
        Caption = 'Raz'#243'n Social'
      end
      object lbTelefono: TLabel
        Left = 1
        Top = 170
        Width = 47
        Height = 13
        Caption = 'Tel'#233'fonos'
      end
      object Label2: TLabel
        Left = 530
        Top = 170
        Width = 18
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fax'
        ExplicitLeft = 563
      end
      object lbEMail: TLabel
        Left = 1
        Top = 194
        Width = 28
        Height = 13
        Caption = 'E-Mail'
      end
      object lbResponsable: TLabel
        Left = 1
        Top = 218
        Width = 61
        Height = 13
        Caption = 'Responsable'
      end
      object Bevel8: TBevel
        Left = 0
        Top = 237
        Width = 762
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        ExplicitWidth = 795
      end
      object lbCodAsistencial: TLabel
        Left = 1
        Top = 250
        Width = 70
        Height = 13
        Caption = 'Cod. Asistenc.'
      end
      object lbCaracter: TLabel
        Left = 214
        Top = 250
        Width = 42
        Height = 13
        Caption = 'Car'#225'cter'
      end
      object lbTipoPrestador: TLabel
        Left = 1
        Top = 275
        Width = 70
        Height = 13
        Caption = 'Tipo Prestador'
      end
      object lbObservaciones: TLabel
        Left = 1
        Top = 298
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object lbDatosUtiles: TLabel
        Left = 5
        Top = 336
        Width = 56
        Height = 13
        Hint = 'Se muestran al momento de la carga de autorizaciones'
        Anchors = [akLeft, akBottom]
        Caption = 'Datos '#250'tiles'
        ExplicitTop = 333
      end
      object lbDomicilio: TLabel
        Left = 2
        Top = 99
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object Bevel4: TBevel
        Left = 0
        Top = 82
        Width = 762
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        ExplicitWidth = 795
      end
      object lbRanking: TLabel
        Left = 494
        Top = 9
        Width = 38
        Height = 13
        Caption = 'Ranking'
      end
      object Label23: TLabel
        Left = 316
        Top = 218
        Width = 78
        Height = 13
        Caption = 'Regi'#243'n Sanitaria'
      end
      object Bevel13: TBevel
        Left = 575
        Top = 0
        Width = 2
        Height = 83
        Anchors = [akTop, akRight]
        ExplicitLeft = 608
      end
      object lblUsuarioContrata: TLabel
        Left = 617
        Top = 218
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label81: TLabel
        Left = 612
        Top = 194
        Width = 67
        Height = 13
        Caption = 'E-Mail D'#233'bitos'
      end
      object lblCel: TLabel
        Left = 257
        Top = 170
        Width = 33
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Celular'
        ExplicitLeft = 290
      end
      object Label83: TLabel
        Left = 71
        Top = 170
        Width = 4
        Height = 13
        Caption = '('
      end
      object Label84: TLabel
        Left = 120
        Top = 170
        Width = 4
        Height = 13
        Caption = ')'
      end
      object Label85: TLabel
        Left = 479
        Top = 274
        Width = 71
        Height = 13
        Caption = 'Motivo de Baja'
      end
      object Label1: TLabel
        Left = 302
        Top = 194
        Width = 75
        Height = 13
        Caption = 'E-Mail Administ.'
      end
      object chkCargaValores: TCheckBox
        Left = 582
        Top = 30
        Width = 95
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Carga Valores'
        TabOrder = 7
        WordWrap = True
        OnClick = chkCargaValoresClick
      end
      object mskCUIT: TMaskEdit
        Left = 77
        Top = 5
        Width = 84
        Height = 21
        Hint = 'CUIT o Clave del Prestador'
        EditMask = '##-########-C;0;_'
        MaxLength = 13
        TabOrder = 0
      end
      object edSecuencia: TIntEdit
        Left = 219
        Top = 5
        Width = 35
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        AutoExit = True
        MaxLength = 6
      end
      object edIdentif: TIntEdit
        Left = 326
        Top = 5
        Width = 54
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object edPrestMutual: TIntEdit
        Left = 440
        Top = 5
        Width = 41
        Height = 21
        TabOrder = 3
        OnExit = edPrestMutualExit
        AutoExit = True
        MaxLength = 6
      end
      object edRSocial: TEdit
        Left = 77
        Top = 32
        Width = 491
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 150
        TabOrder = 5
        OnExit = edRSocialExit
      end
      object edNFantasia: TEdit
        Left = 77
        Top = 59
        Width = 491
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 150
        TabOrder = 6
      end
      object edCelular: TEdit
        Left = 297
        Top = 166
        Width = 217
        Height = 21
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 10
      end
      object edFax: TEdit
        Left = 553
        Top = 166
        Width = 208
        Height = 21
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 11
      end
      object edEMail: TEdit
        Left = 77
        Top = 190
        Width = 220
        Height = 21
        MaxLength = 300
        TabOrder = 12
        OnExit = edEMailExit
      end
      object edResponsable: TEdit
        Left = 77
        Top = 214
        Width = 236
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 150
        TabOrder = 13
      end
      object edAsistencial: TIntEdit
        Left = 77
        Top = 246
        Width = 131
        Height = 21
        TabOrder = 16
        MaxLength = 6
      end
      object cmbCaracter: TArtComboBox
        Left = 259
        Top = 246
        Width = 503
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'TB_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 100
            Visible = True
          end>
        DataSource = dsCaracter
        FieldList = 'TB_DESCRIPCION'
        FieldKey = 'TB_CODIGO'
      end
      object cmbTipoPrestador: TArtComboBox
        Left = 77
        Top = 270
        Width = 392
        Height = 21
        CharCase = ecUpperCase
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 18
        Columns = <
          item
            Expanded = False
            FieldName = 'TP_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TP_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 100
            Visible = True
          end>
        DataSource = dsTipoPrestador
        FieldList = 'TP_DESCRIPCION'
        FieldKey = 'TP_CODIGO'
        OnCloseUp = cmbTipoPrestadorCloseUp
        OnGetCellParams = cmbTipoPrestadorGetCellParams
      end
      object edObservaciones: TMemo
        Left = 77
        Top = 292
        Width = 684
        Height = 35
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 2000
        TabOrder = 19
      end
      object edDomicilio: TEdit
        Left = 77
        Top = 93
        Width = 683
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = clMenu
        Enabled = False
        MaxLength = 200
        ReadOnly = True
        TabOrder = 8
      end
      object edRanking: TEdit
        Left = 536
        Top = 5
        Width = 32
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 4
        OnExit = edRankingExit
      end
      object EdRegionSanitaria: TEdit
        Left = 400
        Top = 214
        Width = 213
        Height = 21
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 50
        ReadOnly = True
        TabOrder = 14
      end
      object fpRegiones: TFormPanel
        Left = 159
        Top = 46
        Width = 355
        Height = 158
        Caption = 'Regiones Sanitarias'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          355
          158)
        object Bevel5: TBevel
          Left = 8
          Top = 37
          Width = 342
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label29: TLabel
          Left = 8
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Regi'#243'n'
        end
        object btnAgregarRegion: TBitBtn
          Left = 275
          Top = 7
          Width = 73
          Height = 26
          Caption = '&Agregar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
            0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
            0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
            0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
            0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
            0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
            0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 1
          OnClick = btnAgregarRegionClick
        end
        object btnQuitarRegion: TBitBtn
          Left = 275
          Top = 47
          Width = 73
          Height = 26
          Caption = '&Quitar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
            0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 3
          OnClick = btnQuitarRegionClick
        end
        object btnCerrarRegion: TBitBtn
          Left = 275
          Top = 122
          Width = 73
          Height = 26
          Caption = '&Cerrar'
          Kind = bkCancel
          NumGlyphs = 2
          TabOrder = 4
        end
        object dgRegiones: TRxDBGrid
          Left = 7
          Top = 45
          Width = 261
          Height = 104
          DataSource = dsRegiones
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'TB_DESCRIPCION'
              Title.Caption = 'Regiones del Prestador'
              Width = 190
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RP_DOMICILIO'
              Title.Alignment = taCenter
              Title.Caption = 'Domicilio'
              Width = 48
              Visible = True
            end>
        end
        inline fraRegiones: TfraCtbTablas
          Left = 45
          Top = 8
          Width = 223
          Height = 23
          TabOrder = 0
          ExplicitLeft = 45
          ExplicitTop = 8
          ExplicitWidth = 223
          DesignSize = (
            223
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 47
            Width = 175
            ExplicitLeft = 47
            ExplicitWidth = 175
          end
          inherited edCodigo: TPatternEdit
            Width = 40
            ExplicitWidth = 40
          end
        end
      end
      object fpBaja: TFormPanel
        Left = 493
        Top = 354
        Width = 603
        Height = 106
        Caption = 'Seleccione prestador relacionado'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          603
          106)
        object gbPresRel: TGroupBox
          Left = 0
          Top = 0
          Width = 603
          Height = 70
          Align = alTop
          Caption = ' Prestador '
          TabOrder = 0
          DesignSize = (
            603
            70)
          inline fraPrestadorRel: TfraPrestador
            Left = 3
            Top = 13
            Width = 596
            Height = 108
            VertScrollBar.Range = 49
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 3
            ExplicitTop = 13
            ExplicitWidth = 596
            ExplicitHeight = 108
            DesignSize = (
              596
              108)
            inherited lbCPostal: TLabel
              Left = 524
              ExplicitLeft = 524
            end
            inherited lbTelefono: TLabel
              Left = 436
              ExplicitLeft = 436
            end
            inherited cmbPrestFantasia: TArtComboBox
              DataSource = nil
            end
            inherited cmbPrestador: TArtComboBox
              Width = 266
              DataSource = fraPrestadorRel.dsDatos
              ExplicitWidth = 266
            end
            inherited edPresLocalidad: TEdit
              Width = 178
              ExplicitWidth = 178
            end
            inherited edPresCPostal: TEdit
              Left = 541
              ExplicitLeft = 541
            end
            inherited edPresTelefono: TEdit
              Left = 456
              ExplicitLeft = 456
            end
          end
        end
        object chkTransfAut: TCheckBox
          Left = 7
          Top = 77
          Width = 239
          Height = 17
          Caption = 'Transferir autorizaciones pendientes de pago'
          TabOrder = 1
        end
        object btnAceptarRel: TBitBtn
          Left = 523
          Top = 75
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          TabOrder = 2
        end
      end
      inline fraDireccionPrest: TfraDomicilioGIS
        Left = 0
        Top = 113
        Width = 768
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        ExplicitTop = 113
        ExplicitWidth = 768
        ExplicitHeight = 50
        DesignSize = (
          768
          50)
        inherited lbCalle: TLabel
          Left = 2
          ExplicitLeft = 2
        end
        inherited lbNro: TLabel
          Left = 591
          ExplicitLeft = 624
        end
        inherited lbPiso: TLabel
          Left = 655
          ExplicitLeft = 688
        end
        inherited lbDto: TLabel
          Left = 707
          ExplicitLeft = 740
        end
        inherited lbCPostal: TLabel
          Left = 2
          Top = 32
          Width = 65
          Caption = 'C'#243'digo Postal'
          ExplicitLeft = 2
          ExplicitTop = 32
          ExplicitWidth = 65
        end
        inherited lbCPA: TLabel
          Left = 132
          Top = 32
          ExplicitLeft = 132
          ExplicitTop = 32
        end
        inherited lbLocalidad: TLabel
          Left = 236
          Top = 32
          ExplicitLeft = 236
          ExplicitTop = 32
        end
        inherited lbProvincia: TLabel
          Left = 548
          Top = 32
          ExplicitLeft = 581
          ExplicitTop = 32
        end
        inherited cmbCalle: TArtComboBox
          Left = 77
          Width = 415
          ExplicitLeft = 77
          ExplicitWidth = 415
        end
        inherited edNumero: TEdit
          Left = 607
          ExplicitLeft = 607
        end
        inherited edPiso: TEdit
          Left = 679
          MaxLength = 2
          ExplicitLeft = 679
        end
        inherited edDto: TEdit
          Left = 731
          MaxLength = 5
          ExplicitLeft = 731
        end
        inherited edCPostal: TIntEdit
          Left = 77
          Top = 28
          Width = 49
          ExplicitLeft = 77
          ExplicitTop = 28
          ExplicitWidth = 49
        end
        inherited cmbLocalidad: TArtComboBox
          Left = 284
          Top = 28
          Width = 257
          ExplicitLeft = 284
          ExplicitTop = 28
          ExplicitWidth = 257
        end
        inherited edProvincia: TEdit
          Left = 596
          Top = 28
          Width = 164
          ExplicitLeft = 596
          ExplicitTop = 28
          ExplicitWidth = 164
        end
        inherited edCPA: TPatternEdit
          Left = 156
          Top = 28
          ExplicitLeft = 156
          ExplicitTop = 28
        end
        inherited btnBuscar: TButton
          Left = 307
          ExplicitLeft = 307
        end
        inherited btnBuscarGIS: TAdvGlowButton
          Left = 495
          ExplicitLeft = 495
        end
        inherited btnMapaGIS: TAdvGlowButton
          Left = 541
          ExplicitLeft = 541
        end
      end
      inline fraUsuariosContrata: TfraCodigoDescripcion
        Left = 652
        Top = 213
        Width = 106
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        ExplicitLeft = 652
        ExplicitTop = 213
        ExplicitWidth = 106
        DesignSize = (
          106
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 100
          Width = 9
          ExplicitLeft = 100
          ExplicitWidth = 9
        end
        inherited edCodigo: TPatternEdit
          Width = 96
          ExplicitWidth = 96
        end
      end
      object fpObservLiquidaciones: TFormPanel
        Left = 257
        Top = 102
        Width = 303
        Height = 117
        Caption = 'Observaciones de Liquidaciones'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          303
          117)
        object lTituloObserv: TLabel
          Left = 3
          Top = 4
          Width = 297
          Height = 16
          AutoSize = False
          Caption = ' Observaciones de Liquidaciones'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object MemoObservLiquidaciones: TMemo
          Left = 2
          Top = 20
          Width = 298
          Height = 70
          Color = clCream
          MaxLength = 250
          TabOrder = 0
        end
        object btnGuardarObservLiquid: TBitBtn
          Left = 152
          Top = 92
          Width = 69
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = 'Guardar'
          Default = True
          Glyph.Data = {
            B6010000424DB601000000000000760000002800000022000000100000000100
            0400000000004001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
            0000AAA88888888888888A000000A8888800000088880A777778888887777800
            0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
            FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
            7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
            FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
            FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
            9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
            F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
            8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
            FFF778016E02AA88888888888888AAA77777777777777A006701}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = btnGuardarObservLiquidClick
        end
        object btnCerrarObservLiquid: TBitBtn
          Left = 230
          Top = 92
          Width = 69
          Height = 22
          Anchors = [akRight, akBottom]
          Caption = 'Cerrar'
          Kind = bkCancel
          NumGlyphs = 2
          TabOrder = 2
          OnClick = btnCerrarObservLiquidClick
        end
      end
      object chkReferente: TCheckBox
        Left = 681
        Top = 30
        Width = 77
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Referente'
        TabOrder = 23
      end
      object edMailDebitos: TEdit
        Left = 684
        Top = 190
        Width = 76
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 300
        TabOrder = 24
        OnExit = edMailDebitosExit
      end
      object edTelNumero: TEdit
        Left = 132
        Top = 166
        Width = 113
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 25
      end
      object edTelCaract: TEdit
        Left = 77
        Top = 166
        Width = 41
        Height = 21
        TabOrder = 26
      end
      inline fraMotivoBaja: TfraCodigoDescripcion
        Left = 556
        Top = 269
        Width = 207
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 27
        ExplicitLeft = 556
        ExplicitTop = 269
        ExplicitWidth = 207
        DesignSize = (
          207
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Width = 150
          ExplicitLeft = 56
          ExplicitWidth = 150
        end
        inherited edCodigo: TPatternEdit
          Width = 51
          ExplicitWidth = 51
        end
      end
      object edMailAdmin: TEdit
        Left = 378
        Top = 190
        Width = 227
        Height = 21
        MaxLength = 300
        TabOrder = 28
        OnExit = edMailAdminExit
      end
      object fpConsultorio: TFormPanel
        Left = 309
        Top = 89
        Width = 348
        Height = 96
        Caption = 'Observaciones de Liquidaciones'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        OnBeforeShow = fpConsultorioBeforeShow
        DesignSize = (
          348
          96)
        object Bevel31: TBevel
          Left = 5
          Top = 61
          Width = 339
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label90: TLabel
          Left = 8
          Top = 38
          Width = 52
          Height = 13
          Caption = 'Delegaci'#243'n'
        end
        object btnGuardarConsultorio: TBitBtn
          Left = 197
          Top = 67
          Width = 69
          Height = 23
          Anchors = [akRight, akBottom]
          Caption = 'Guardar'
          Default = True
          Glyph.Data = {
            B6010000424DB601000000000000760000002800000022000000100000000100
            0400000000004001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
            0000AAA88888888888888A000000A8888800000088880A777778888887777800
            0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
            FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
            7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
            FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
            FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
            9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
            F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
            8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
            FFF778016E02AA88888888888888AAA77777777777777A006701}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = btnGuardarConsultorioClick
        end
        object btnCerrarConsultorio: TBitBtn
          Left = 275
          Top = 67
          Width = 69
          Height = 23
          Anchors = [akRight, akBottom]
          Caption = 'Cerrar'
          Kind = bkCancel
          NumGlyphs = 2
          TabOrder = 1
          OnClick = btnCerrarConsultorioClick
        end
        inline fraDelegacion: TfraDelegacion
          Left = 67
          Top = 33
          Width = 276
          Height = 23
          TabOrder = 2
          ExplicitLeft = 67
          ExplicitTop = 33
          ExplicitWidth = 276
          DesignSize = (
            276
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 211
            ExplicitWidth = 211
          end
        end
        object chkConsultorio: TCheckBox
          Left = 6
          Top = 8
          Width = 75
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Consultorio'
          TabOrder = 3
          OnClick = chkConsultorioClick
        end
      end
      object edHabilitaciones: TMemo
        Left = 77
        Top = 331
        Width = 684
        Height = 45
        Anchors = [akLeft, akRight, akBottom]
        MaxLength = 1999
        TabOrder = 30
      end
      object chkVisadoDocum: TCheckBox
        Left = 681
        Top = 51
        Width = 77
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'VD'
        TabOrder = 31
      end
      object chkCEM: TCheckBox
        Left = 582
        Top = 51
        Width = 74
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'CEM'
        TabOrder = 32
      end
    end
    object tsDatosEcon: TTabSheet
      Caption = 'Datos econ'#243'micos'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        764
        378)
      object lbBonificacion: TLabel
        Left = 3
        Top = 420
        Width = 56
        Height = 13
        Caption = 'Bonificaci'#243'n'
      end
      object lbDiasVenc: TLabel
        Left = 3
        Top = 386
        Width = 60
        Height = 13
        Caption = 'D'#237'as Vencim.'
      end
      object lbPlazoDebito: TLabel
        Left = 95
        Top = 386
        Width = 63
        Height = 13
        Caption = 'Plazo d'#233'bitos'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 294
        Width = 763
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        ExplicitWidth = 796
      end
      object lbLimite: TLabel
        Left = 193
        Top = 386
        Width = 27
        Height = 13
        Caption = 'L'#237'mite'
      end
      object lbFImpresionFormInscripcion: TLabel
        Left = 4
        Top = 440
        Width = 70
        Height = 26
        Caption = 'F. Impr. Form. Inscripc.'
        WordWrap = True
      end
      object Label25: TLabel
        Left = 603
        Top = 386
        Width = 58
        Height = 13
        Caption = 'Cartilla Web'
      end
      object edBonificacion: TCurrencyEdit
        Left = 77
        Top = 416
        Width = 95
        Height = 22
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxValue = 100.000000000000000000
        TabOrder = 11
      end
      object edDiasVenci: TIntEdit
        Left = 63
        Top = 382
        Width = 30
        Height = 21
        TabOrder = 3
        MaxLength = 3
      end
      object edPlazoDebitos: TIntEdit
        Left = 158
        Top = 382
        Width = 30
        Height = 21
        TabOrder = 4
        MaxLength = 3
      end
      object chkContratoART: TCheckBox
        Left = 265
        Top = 385
        Width = 84
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Contrato ART'
        TabOrder = 6
      end
      object chkContratoMutualVig: TCheckBox
        Left = 357
        Top = 385
        Width = 105
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Contrato Mut. Vig.'
        TabOrder = 7
      end
      object chkAuditable: TCheckBox
        Left = 518
        Top = 384
        Width = 79
        Height = 18
        TabStop = False
        Alignment = taLeftJustify
        Caption = 'Alcance AMF'
        Enabled = False
        TabOrder = 9
      end
      object chkVisible: TCheckBox
        Left = 468
        Top = 385
        Width = 45
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Visible'
        TabOrder = 8
      end
      object edLimite: TIntEdit
        Left = 221
        Top = 382
        Width = 36
        Height = 21
        TabOrder = 5
        MaxLength = 3
      end
      object edFImprFormInscripc: TDateComboBox
        Left = 77
        Top = 443
        Width = 88
        Height = 21
        MaxDateCombo = edValNomVigHasta
        AutoExit = True
        TabOrder = 12
      end
      object gbDatosContables: TGroupBox
        Left = 0
        Top = 136
        Width = 763
        Height = 237
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Datos Contables '
        TabOrder = 2
        DesignSize = (
          763
          237)
        object Label24: TLabel
          Left = 5
          Top = 21
          Width = 72
          Height = 13
          Caption = 'Fecha Revisi'#243'n'
        end
        object lbTipoComprobante: TLabel
          Left = 106
          Top = 46
          Width = 103
          Height = 13
          Caption = 'Tipo de Comprobante'
        end
        object lbIngresosBrutos: TLabel
          Left = 5
          Top = 81
          Width = 76
          Height = 13
          Caption = 'Ingresos Brutos'
        end
        object lbConcepto: TLabel
          Left = 106
          Top = 81
          Width = 46
          Height = 13
          Caption = 'Concepto'
        end
        object lbGanancias: TLabel
          Left = 5
          Top = 142
          Width = 49
          Height = 13
          Caption = 'Ganancias'
        end
        object lbIVA: TLabel
          Left = 5
          Top = 171
          Width = 29
          Height = 13
          Caption = 'I.V.A.'
        end
        object lblMatricula: TLabel
          Left = 574
          Top = 171
          Width = 68
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Nro.Matr'#237'cula:'
          ExplicitLeft = 607
        end
        object Bevel1: TBevel
          Left = 9
          Top = 66
          Width = 748
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsBottomLine
          ExplicitWidth = 781
        end
        object Label26: TLabel
          Left = 171
          Top = 21
          Width = 119
          Height = 13
          Caption = 'Vto. Exclusi'#243'n Ganancias'
        end
        object Label27: TLabel
          Left = 382
          Top = 21
          Width = 146
          Height = 13
          Caption = 'Vto. Exclusi'#243'n Ingresos Brutos'
        end
        object Label38: TLabel
          Left = 5
          Top = 196
          Width = 73
          Height = 13
          AutoSize = False
          Caption = 'Observaciones'
        end
        object Label64: TLabel
          Left = 576
          Top = 80
          Width = 113
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Actividad seg'#250'n Rentas'
          ExplicitLeft = 609
        end
        object lblIBDescripcion: TLabel
          Left = 5
          Top = 109
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object lblIBObservaciones: TLabel
          Left = 414
          Top = 109
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Bevel27: TBevel
          Left = 8
          Top = 128
          Width = 748
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsBottomLine
          ExplicitWidth = 781
        end
        object chkFactura: TCheckBox
          Left = 5
          Top = 44
          Width = 92
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Factura'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cmbTipoComprobante: TArtComboBox
          Left = 213
          Top = 43
          Width = 545
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 6
          Columns = <
            item
              Expanded = False
              FieldName = 'TB_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TB_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 440
              Visible = True
            end>
          DataSource = dsTipoComprobante
          FieldList = 'TB_DESCRIPCION'
          FieldKey = 'TB_CODIGO'
          ClearOnCancel = True
        end
        object chkIngBrutos: TCheckBox
          Left = 81
          Top = 79
          Width = 16
          Height = 17
          Alignment = taLeftJustify
          TabOrder = 7
          OnClick = chkIngBrutosClick
        end
        object cmbIngBrutConcepto: TArtComboBox
          Left = 156
          Top = 77
          Width = 229
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 8
          OnChange = cmbIngBrutConceptoChange
          Columns = <
            item
              Expanded = False
              FieldName = 'IB_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IB_RETENCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 440
              Visible = True
            end>
          DataSource = dsIngBrutConceptos
          FieldList = 'IB_RETENCION'
          FieldKey = 'IB_CODIGO'
        end
        object ToolBarIngresosBrutos: TToolBar
          Left = 388
          Top = 77
          Width = 101
          Height = 21
          Align = alNone
          Anchors = [akTop, akRight]
          ButtonHeight = 29
          ButtonWidth = 85
          Caption = 'ToolBarIngresosBrutos'
          Enabled = False
          ShowCaptions = True
          TabOrder = 9
          object tbIngresoBrutos: TToolButton
            Left = 0
            Top = 0
            Caption = 'Nro.Ing.Brutos'
            DropdownMenu = pmnuIngBrutos
            Enabled = False
            ImageIndex = 0
            Style = tbsDropDown
            OnClick = tbIngresoBrutosClick
          end
        end
        object mskIngBrutosNro: TMaskEdit
          Left = 488
          Top = 76
          Width = 80
          Height = 21
          Hint = 'CUIT o Clave del Prestador'
          Anchors = [akTop, akRight]
          EditMask = '###-######-#;0;_'
          MaxLength = 12
          TabOrder = 10
        end
        object cmbRetDeGanacias: TArtComboBox
          Left = 84
          Top = 138
          Width = 485
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 11
          OnExit = cmbRetDeGanaciasExit
          Columns = <
            item
              Expanded = False
              FieldName = 'TB_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TB_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 440
              Visible = True
            end>
          DataSource = dsRetDeGanacias
          FieldList = 'TB_DESCRIPCION'
          FieldKey = 'TB_CODIGO'
        end
        object edMatricula: TEdit
          Left = 650
          Top = 169
          Width = 110
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 8
          TabOrder = 14
        end
        object chkRetCajaMedico: TCheckBox
          Left = 574
          Top = 142
          Width = 153
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Retenci'#243'n Caja de M'#233'dicos'
          TabOrder = 12
          OnClick = chkRetCajaMedicoClick
        end
        object dcVtoGanancias: TDateComboBox
          Left = 293
          Top = 17
          Width = 88
          Height = 21
          AutoExit = True
          TabOrder = 1
        end
        object dcVtoIngBrutos: TDateComboBox
          Left = 531
          Top = 17
          Width = 88
          Height = 21
          AutoExit = True
          TabOrder = 2
        end
        object dcFechaRevision: TDateComboBox
          Left = 81
          Top = 17
          Width = 88
          Height = 21
          AutoExit = True
          TabOrder = 0
        end
        object cmbIVA: TArtComboBox
          Left = 84
          Top = 166
          Width = 485
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 13
          OnExit = cmbRetDeGanaciasExit
          Columns = <
            item
              Expanded = False
              FieldName = 'TB_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TB_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 440
              Visible = True
            end>
          DataSource = dsIVA
          FieldList = 'TB_DESCRIPCION'
          FieldKey = 'TB_CODIGO'
        end
        object mObsContables: TMemo
          Left = 84
          Top = 192
          Width = 673
          Height = 38
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 2000
          TabOrder = 15
        end
        object chkIVADiscr: TCheckBox
          Left = 628
          Top = 20
          Width = 97
          Height = 17
          Caption = 'IVA discriminado'
          TabOrder = 3
        end
        object edCA_ACTIVIDAD: TIntEdit
          Left = 692
          Top = 76
          Width = 65
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 16
          MaxLength = 6
        end
        object edIBDescripcion: TEdit
          Left = 84
          Top = 105
          Width = 321
          Height = 21
          TabOrder = 17
        end
        object edIBObservaciones: TEdit
          Left = 490
          Top = 105
          Width = 266
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
        end
        object chkFdoTierradelFuego: TCheckBox
          Left = 747
          Top = 20
          Width = 131
          Height = 17
          Caption = 'Fdo. Tierra del Fuego'
          TabOrder = 4
        end
      end
      inline fraCartillaWeb: TfraCtbTablas
        Left = 663
        Top = 381
        Width = 101
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        ExplicitLeft = 663
        ExplicitTop = 381
        ExplicitWidth = 101
        ExplicitHeight = 24
        DesignSize = (
          101
          24)
        inherited cmbDescripcion: TArtComboBox
          Left = 28
          Width = 71
          ExplicitLeft = 28
          ExplicitWidth = 71
        end
        inherited edCodigo: TPatternEdit
          Width = 22
          ExplicitWidth = 22
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 67
        Width = 763
        Height = 68
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Domicilio Comercial'
        TabOrder = 1
        DesignSize = (
          763
          68)
        inline fraDireccionCom: TfraDireccion
          Left = 5
          Top = 15
          Width = 754
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 15
          ExplicitWidth = 754
          ExplicitHeight = 48
          DesignSize = (
            754
            48)
          inherited lbNro: TLabel
            Left = 539
            ExplicitLeft = 572
          end
          inherited lbPiso: TLabel
            Left = 611
            ExplicitLeft = 644
          end
          inherited lbDto: TLabel
            Left = 687
            ExplicitLeft = 720
          end
          inherited lbCPostal: TLabel
            Top = 29
            ExplicitTop = 29
          end
          inherited lbCPA: TLabel
            Left = 134
            Top = 29
            ExplicitLeft = 134
            ExplicitTop = 29
          end
          inherited lbLocalidad: TLabel
            Left = 210
            Top = 29
            ExplicitLeft = 210
            ExplicitTop = 29
          end
          inherited lbProvincia: TLabel
            Left = 592
            Top = 29
            ExplicitLeft = 625
            ExplicitTop = 29
          end
          inherited cmbCalle: TArtComboBox
            Left = 77
            Width = 450
            ExplicitLeft = 77
            ExplicitWidth = 450
          end
          inherited edNumero: TEdit
            Left = 561
            ExplicitLeft = 561
          end
          inherited edPiso: TEdit
            Left = 637
            Width = 42
            ExplicitLeft = 637
            ExplicitWidth = 42
          end
          inherited edDto: TEdit
            Left = 709
            Width = 42
            ExplicitLeft = 709
            ExplicitWidth = 42
          end
          inherited edCPostal: TIntEdit
            Left = 77
            Top = 25
            Width = 54
            ExplicitLeft = 77
            ExplicitTop = 25
            ExplicitWidth = 54
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 259
            Top = 25
            Width = 325
            ExplicitLeft = 259
            ExplicitTop = 25
            ExplicitWidth = 325
          end
          inherited edProvincia: TEdit
            Left = 641
            Top = 25
            Width = 112
            ExplicitLeft = 641
            ExplicitTop = 25
            ExplicitWidth = 112
          end
          inherited edCPA: TPatternEdit
            Left = 157
            Top = 25
            Width = 50
            ExplicitLeft = 157
            ExplicitTop = 25
            ExplicitWidth = 50
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = -1
        Width = 763
        Height = 67
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Domicilio Legal'
        TabOrder = 0
        DesignSize = (
          763
          67)
        inline fraDireccionLegal: TfraDireccion
          Left = 5
          Top = 15
          Width = 753
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraDireccionLegalExit
          ExplicitLeft = 5
          ExplicitTop = 15
          ExplicitWidth = 753
          ExplicitHeight = 48
          DesignSize = (
            753
            48)
          inherited lbNro: TLabel
            Left = 538
            ExplicitLeft = 571
          end
          inherited lbPiso: TLabel
            Left = 610
            ExplicitLeft = 643
          end
          inherited lbDto: TLabel
            Left = 686
            ExplicitLeft = 719
          end
          inherited lbCPostal: TLabel
            Top = 29
            ExplicitTop = 29
          end
          inherited lbCPA: TLabel
            Left = 134
            Top = 29
            ExplicitLeft = 134
            ExplicitTop = 29
          end
          inherited lbLocalidad: TLabel
            Left = 210
            Top = 29
            ExplicitLeft = 210
            ExplicitTop = 29
          end
          inherited lbProvincia: TLabel
            Left = 591
            Top = 29
            ExplicitLeft = 624
            ExplicitTop = 29
          end
          inherited cmbCalle: TArtComboBox
            Left = 77
            Width = 450
            ExplicitLeft = 77
            ExplicitWidth = 450
          end
          inherited edNumero: TEdit
            Left = 560
            ExplicitLeft = 560
          end
          inherited edPiso: TEdit
            Left = 636
            Width = 42
            ExplicitLeft = 636
            ExplicitWidth = 42
          end
          inherited edDto: TEdit
            Left = 708
            Width = 42
            ExplicitLeft = 708
            ExplicitWidth = 42
          end
          inherited edCPostal: TIntEdit
            Left = 77
            Top = 25
            Width = 54
            ExplicitLeft = 77
            ExplicitTop = 25
            ExplicitWidth = 54
          end
          inherited cmbLocalidad: TArtComboBox
            Left = 259
            Top = 25
            Width = 324
            ExplicitLeft = 259
            ExplicitTop = 25
            ExplicitWidth = 324
          end
          inherited edProvincia: TEdit
            Left = 640
            Top = 25
            Width = 112
            ExplicitLeft = 640
            ExplicitTop = 25
            ExplicitWidth = 112
          end
          inherited edCPA: TPatternEdit
            Left = 157
            Top = 25
            Width = 50
            ExplicitLeft = 157
            ExplicitTop = 25
            ExplicitWidth = 50
          end
        end
      end
    end
    object tsDatosMed: TTabSheet
      Caption = 'Datos m'#233'dicos'
      ImageIndex = 2
      object gbCamas: TGroupBox
        Left = 0
        Top = 35
        Width = 764
        Height = 98
        Align = alTop
        Caption = 'Camas'
        TabOrder = 1
        object lbPiso: TLabel
          Left = 184
          Top = 18
          Width = 19
          Height = 13
          Caption = 'Piso'
        end
        object lbTerIntUnidadCoronaria: TLabel
          Left = 10
          Top = 36
          Width = 92
          Height = 26
          Alignment = taRightJustify
          Caption = 'Terapia intensiva / '#13#10'Unidad coronaria'
        end
        object lbAuislamientoTerInt: TLabel
          Left = 10
          Top = 66
          Width = 94
          Height = 26
          Alignment = taRightJustify
          Caption = 'Aislamiento terapia '#13#10'                intensiva'
        end
        object lbQuirofanos: TLabel
          Left = 184
          Top = 46
          Width = 53
          Height = 13
          Caption = 'Quir'#243'fanos'
        end
        object lbGuardia: TLabel
          Left = 184
          Top = 73
          Width = 37
          Height = 13
          Caption = 'Guardia'
          Visible = False
        end
        object lbTerapiaIntensiva: TLabel
          Left = 8
          Top = 18
          Width = 82
          Height = 13
          Caption = 'Terapia intensiva'
        end
        object lbSalaDeRayos: TLabel
          Left = 548
          Top = 18
          Width = 50
          Height = 13
          Caption = 'Sala rayos'
          Visible = False
        end
        object lbConsExt: TLabel
          Left = 548
          Top = 39
          Width = 62
          Height = 26
          Caption = 'Consultorios '#13#10'externos'
          Visible = False
        end
        object Label11: TLabel
          Left = 548
          Top = 73
          Width = 43
          Height = 13
          Caption = 'Matr'#237'cula'
          Visible = False
        end
        object Label51: TLabel
          Left = 462
          Top = 17
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object Label52: TLabel
          Left = 462
          Top = 45
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object edPiso: TIntEdit
          Left = 247
          Top = 14
          Width = 49
          Height = 21
          TabOrder = 3
          MaxLength = 4
        end
        object edTIUnidCor: TIntEdit
          Left = 114
          Top = 41
          Width = 49
          Height = 21
          TabOrder = 1
          MaxLength = 4
        end
        object edAislamTI: TIntEdit
          Left = 114
          Top = 69
          Width = 49
          Height = 21
          TabOrder = 2
          MaxLength = 4
        end
        object edQuirofano: TIntEdit
          Left = 247
          Top = 41
          Width = 49
          Height = 21
          TabOrder = 4
          MaxLength = 3
        end
        object edGuardia: TIntEdit
          Left = 247
          Top = 69
          Width = 49
          Height = 21
          TabOrder = 5
          Visible = False
          MaxLength = 2
        end
        object edTI: TIntEdit
          Left = 114
          Top = 14
          Width = 49
          Height = 21
          TabOrder = 0
          MaxLength = 4
        end
        object edSRayos: TIntEdit
          Left = 623
          Top = 14
          Width = 49
          Height = 21
          TabOrder = 6
          Visible = False
          MaxLength = 2
        end
        object edConsExt: TIntEdit
          Left = 623
          Top = 41
          Width = 49
          Height = 21
          TabOrder = 7
          Visible = False
          MaxLength = 3
        end
        object rbMatNacional: TRadioButton
          Left = 680
          Top = 64
          Width = 64
          Height = 15
          Caption = 'Nacional'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          TabStop = True
          Visible = False
        end
        object rbMatProvincial: TRadioButton
          Left = 680
          Top = 79
          Width = 64
          Height = 12
          Caption = 'Provincial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Visible = False
        end
        object EdMatProfesional: TEdit
          Left = 623
          Top = 69
          Width = 49
          Height = 21
          MaxLength = 8
          TabOrder = 8
          Visible = False
        end
        object chkGuardiaAct: TCheckBox
          Left = 314
          Top = 17
          Width = 93
          Height = 17
          Caption = 'Guardia activa'
          TabOrder = 11
          OnClick = chkGuardiaActClick
        end
        object chkGuardiaPas: TCheckBox
          Left = 314
          Top = 45
          Width = 93
          Height = 17
          Caption = 'Guardia pasiva'
          TabOrder = 14
          OnClick = chkGuardiaPasClick
        end
        object edDesdeAct: TMaskEdit
          Left = 417
          Top = 14
          Width = 36
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 12
          Text = '  :  '
        end
        object edHastaAct: TMaskEdit
          Left = 485
          Top = 14
          Width = 36
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 13
          Text = '  :  '
        end
        object edDesdePas: TMaskEdit
          Left = 417
          Top = 41
          Width = 35
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 15
          Text = '  :  '
        end
        object edHastaPas: TMaskEdit
          Left = 485
          Top = 41
          Width = 36
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 16
          Text = '  :  '
        end
      end
      object pnlArriba: TPanel
        Left = 0
        Top = 0
        Width = 764
        Height = 35
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object chkCronicos: TCheckBox
          Left = 561
          Top = 10
          Width = 116
          Height = 17
          Caption = 'Internados Cr'#243'nicos'
          TabOrder = 0
          Visible = False
        end
        object chkResonancia: TCheckBox
          Left = 125
          Top = 10
          Width = 77
          Height = 17
          Caption = 'Resonancia'
          TabOrder = 1
          Visible = False
        end
        object chkTAC: TCheckBox
          Left = 209
          Top = 10
          Width = 42
          Height = 17
          Caption = 'TAC'
          TabOrder = 2
          Visible = False
        end
        object chkElectromiograma: TCheckBox
          Left = 260
          Top = 10
          Width = 99
          Height = 17
          Caption = 'Electromiograma'
          TabOrder = 3
          Visible = False
        end
        object chkAmbulancia: TCheckBox
          Left = 376
          Top = 10
          Width = 74
          Height = 17
          Caption = 'Ambulancia'
          TabOrder = 4
          Visible = False
        end
        object chkRX: TCheckBox
          Left = 462
          Top = 10
          Width = 35
          Height = 17
          Caption = 'RX'
          TabOrder = 5
          Visible = False
        end
        object chkFKT: TCheckBox
          Left = 508
          Top = 10
          Width = 40
          Height = 17
          Caption = 'FKT'
          TabOrder = 6
          Visible = False
        end
        object chkFactAnestesia: TCheckBox
          Left = 10
          Top = 10
          Width = 106
          Height = 17
          Caption = 'Factura anestesia'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          WordWrap = True
        end
        object chkEcografia: TCheckBox
          Left = 694
          Top = 10
          Width = 66
          Height = 17
          Caption = 'Ecograf'#237'a'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Visible = False
          WordWrap = True
        end
      end
      object CoolBarEsp: TCoolBar
        Left = 0
        Top = 133
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = tbarEspecialidades
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object tbarEspecialidades: TToolBar
          Left = 9
          Top = 0
          Width = 207
          Height = 24
          Align = alNone
          AutoSize = True
          ButtonHeight = 24
          ButtonWidth = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbFiltrarDatosMed: TToolButton
            Left = 0
            Top = 0
            Hint = 'Filtrar datos m'#233'dicos'
            Caption = 'tbFiltrarDatosMed'
            DropdownMenu = pmuFiltrarDatosMed
            ImageIndex = 16
            Style = tbsDropDown
          end
          object ToolButton21: TToolButton
            Left = 39
            Top = 0
            Width = 8
            Caption = 'ToolButton21'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object tbAgregarEsp: TToolButton
            Tag = 1
            Left = 47
            Top = 0
            Hint = 'Agregar Especialidad'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarEspClick
          end
          object tbModificarEsp: TToolButton
            Tag = 2
            Left = 71
            Top = 0
            Hint = 'Modificar Especialidad'
            Caption = 'tbModificarEsp'
            ImageIndex = 24
            ParentShowHint = False
            ShowHint = True
            OnClick = tbModificarEspClick
          end
          object tbEliminarEsp: TToolButton
            Tag = 3
            Left = 95
            Top = 0
            Hint = 'Eliminar Especialidad'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarEspClick
          end
          object ToolButton5: TToolButton
            Left = 119
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarEsp: TToolButton
            Left = 127
            Top = 0
            Hint = 'Ordenar'
            Caption = 'tbOrdenarEsp'
            ImageIndex = 5
            OnClick = tbOrdenarEspClick
          end
          object ToolButton8: TToolButton
            Left = 151
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarEsp: TToolButton
            Left = 159
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarEspClick
          end
          object tbImprimirEsp: TToolButton
            Left = 183
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirEspClick
          end
        end
      end
      object dbgGrillaEsp: TRxDBGrid
        Left = 0
        Top = 161
        Width = 764
        Height = 217
        Align = alClient
        DataSource = dsEspecialidades
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgGrillaEspDblClick
        IniStorage = FormPlacement
        RowColor2 = 16776176
        OnGetCellParams = dbgGrillaEspGetCellParams
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_ESPECIALIDAD'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_DESCRIPCION'
            Title.Caption = 'Especialidad'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PE_OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_FECHABAJA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Baja'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_GUARDIAACT'
            Title.Alignment = taCenter
            Title.Caption = 'Guardia Act.'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_DESDEGUARDIAACT'
            Title.Alignment = taCenter
            Title.Caption = 'Desde Act.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_HASTAGUARDIAACT'
            Title.Alignment = taCenter
            Title.Caption = 'Hasta Act.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_GUARDIAPAS'
            Title.Alignment = taCenter
            Title.Caption = 'Guardia Pas.'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_DESDEGUARDIAPAS'
            Title.Alignment = taCenter
            Title.Caption = 'Desde Pas.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PE_HASTAGUARDIAPAS'
            Title.Alignment = taCenter
            Title.Caption = 'Hasta Pas.'
            Visible = True
          end>
      end
      object fpEspecialidades: TFormPanel
        Left = 336
        Top = 160
        Width = 400
        Height = 175
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        Position = poOwnerFormCenter
        ActiveControl = cmbEspecialidad
        Constraints.MinHeight = 175
        Constraints.MinWidth = 400
        DesignSize = (
          400
          175)
        object lbEspCodigo: TLabel
          Left = 7
          Top = 10
          Width = 127
          Height = 13
          Caption = 'C'#243'd. y Desc. Especialidad:'
        end
        object lbEspObservaciones: TLabel
          Left = 7
          Top = 87
          Width = 75
          Height = 13
          Caption = 'Observaciones:'
        end
        object Bevel3: TBevel
          Left = 0
          Top = 140
          Width = 400
          Height = 8
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label53: TLabel
          Left = 183
          Top = 36
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object Label54: TLabel
          Left = 183
          Top = 61
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object cmbEspecialidad: TArtComboBox
          Left = 140
          Top = 7
          Width = 255
          Height = 21
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 0
          Columns = <
            item
              Expanded = False
              FieldName = 'ES_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Visible = True
            end>
          DataSource = dsDescEspecialidad
          FieldList = 'ES_DESCRIPCION'
          FieldKey = 'ES_CODIGO'
          OnDropDown = cmbEspecialidadDropDown
          ClearOnCancel = True
        end
        object mObservaciones: TMemo
          Left = 91
          Top = 84
          Width = 302
          Height = 52
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 7
        end
        object btnEspGuardar: TBitBtn
          Left = 318
          Top = 145
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Guardar'
          Glyph.Data = {
            B6080000424DB608000000000000360000002800000022000000100000000100
            200000000000800800000000000000000000000000000000000000FF000000FF
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000FF000000FF
            000000FF00808080800080808080808080008080808080808000808080808080
            80008080808080808000808080808080800080808080808080008080800000FF
            000000FF00808080800080808080808080008080808080808000000000000000
            0000000000000000000000000000000000008080808080808000808080808080
            80000000000000FF0000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0808080
            800080808080808080008080808080808000808080C0C0C0C000C0C0C0C0C0C0
            C000C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0
            C000808080808080800080808080808080008080800000000000C0C0C0FFFFFF
            FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFC0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000808080C0C0C0
            C000FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
            C000C0C0C0C0C0C0C0008080800000000000C0C0C08080808000808080000000
            0000C0C0C0FFFFFFFF00C0C0C080808080000000000000FF0000C0C0C0FFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFC0C0C0C000808080C0C0C0C000C0C0C0C0C0C0
            C000808080C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
            8000FFFFFFC0C0C0C000C0C0C0C0C0C0C0008080800000000000C0C0C0808080
            80008080800000000000C0C0C0FFFFFFFF00C0C0C080808080000000000000FF
            0000C0C0C0FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFC0C0C0C000808080C0C0C0
            C000C0C0C0C0C0C0C000808080C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080
            800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0C000C0C0C0808080
            800080808080808080008080808080808000808080C0C0C0C000C0C0C0808080
            80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000FFFFFFFFFFFF
            FF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0
            C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
            C000C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
            C000C0C0C0808080800080808080808080008080808080808000808080808080
            8000808080C0C0C0C000C0C0C080808080000000000000FF0000C0C0C0FFFFFF
            FF00FFFFFFFFFFFFFF00C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
            C000C0C0C0C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
            8000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF
            0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
            800000FF008080808000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
            80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000808080FFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0
            C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
            C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF0000C0C0C0FFFFFF
            FF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
            8000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF
            0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
            800000FF008080808000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00000000808080
            80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000
            0000C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000808080FFFFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0
            C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
            FF00FFFFFFC0C0C0C000C0C0C0808080800000FF000000FF0000808080808080
            8000808080808080800080808080808080008080808080808000808080808080
            80008080808080808000808080808080800000FF000000FF000000FF00C0C0C0
            C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
            C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C00000FF0000}
          NumGlyphs = 2
          TabOrder = 8
          OnClick = btnEspGuardarClick
        end
        object btnEspCancelar: TBitBtn
          Left = 238
          Top = 145
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = 'Cancelar'
          Glyph.Data = {
            E60A0000424DE60A000000000000360000002800000026000000120000000100
            200000000000B00A00000000000000000000000000000000000000FF004D00FF
            000000FF00FF0000990000FF000000FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF00000C0C0CFF00FF000C00FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF00003333CCFF0000
            FFCC0000990000FF009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF00000000FFFF00FF
            00FF00FF00FF86868600868686860C0C0C8600FF000C00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF4D4D4D0000FF00FF00FF00003333CCFF0066FFCC0000FF660000
            99FF00FF000000FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF8686
            8600CCCCCC86868686CC0C0C0C8600FF000C00FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF00003333CCFF3399FFCC0066FF990000CCFF0000990000FF
            009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF0000FF0000FF000000FF000000FF00FF86868600FFFFFF86CCCC
            CCFF868686CC3333338600FF003300FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF00004D4D4DFF00FF004D00FF00FF00FF
            000000FF00FF3333CC003399FF330000FFFF0000990000FF009900FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF00000000FFFF00FF
            00FF00FF00FF00FF000000FF00FF00FF0000868686FFFFFFFF86CCCCCCFF3333
            33CC00FF003300FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF8686860000FF008600FF000000FF00FF00FF000000FF00FF00FF
            00000000CCFF3399FFCC0000CC99000099CC00FF000000FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF0000FF000000990000FF009900FF00FF00FF
            000000FF00FF00FF000000FF00FF86868600FFFFFF86868686FF3333338600FF
            003300FF00FF00FF000000FF00FF00FF000000FF00FF00FF0000868686FF0C0C
            0C8600FF000C00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF0000
            CC000066FF00000099FF00FF000000FF000000FF00FF00FF000000FF00FF00FF
            00000000FFFF000099FF00FF000000FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF0000868686FFCCCCCC86333333CC00FF003300FF00FF00FF
            000000FF00FF00FF000000FF00FF868686000C0C0C8600FF000C00FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF00000000CCFF0000
            FFCC0000990000FF009900FF00FF00FF000000FF00FF0000FF000000990000FF
            009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF86868600868686860C0C0C8600FF000C00FF000000FF00FF00FF
            0000868686FF0C0C0C8600FF000C00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF0000CC000000FF000000
            99FF00FF000000FF00000000FFFF000099FF00FF000000FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            0000868686FF868686860C0C0C8600FF000C00FF00FF868686000C0C0C8600FF
            000C00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF00000000CCFF0000FFCC000099000000
            FF990000990000FF009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF8686
            8600868686860C0C0C868686860C0C0C0C8600FF000C00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF0000CC000000FF00000099FF00FF000000FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF0000868686FF8686
            86863333338600FF003300FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            00000000CCFF0000FFCC000099000000CC990000990000FF009900FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF86868600868686860C0C0C868686860C0C0C
            0C8600FF000C00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF0000CC000000FF000000
            99FF00FF000000FF00000000CCFF000099CC00FF000000FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            0000868686FF868686860C0C0C8600FF000C00FF00FF868686000C0C0C8600FF
            000C00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF0000CC000000CC000000FFCC0000990000FF009900FF00FF00FF
            000000FF00FF0000CC000000990000FF009900FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF0000868686FF86868686868686860C0C
            0C8600FF000C00FF000000FF00FF00FF0000868686FF0C0C0C8600FF000C00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF0000CC000000CC003399
            FFCC0000FF99000099FF00FF000000FF000000FF00FF00FF000000FF00FF00FF
            00000000CCFF000099CC00FF000000FF000000FF00FF00FF000000FF00FF00FF
            0000868686FF86868686CCCCCC86868686CC0C0C0C8600FF000C00FF00FF00FF
            000000FF00FF00FF000000FF00FF868686000C0C0C8600FF000C00FF00FF00FF
            000000FF00FF00FF00000000CCFF3399FFCC0066FF990000FFFF0000990000FF
            009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF0000
            CC000000990000FF009900FF00FF00FF000000FF00FF86868600FFFFFF86CCCC
            CCFF868686CC0C0C0C8600FF000C00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF0000868686FF0C0C0C8600FF000C00FF000000FF00FF0000
            CC003399FF000066FFFF0000FF66000099FF00FF000000FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF0000
            CC0000FF000000FF0000868686FFFFFFFF86CCCCCCFF868686CC0C0C0C8600FF
            000C00FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF00004D4D4DFF00FF004D00FF0000666699000000CC660000
            CCCC6666990000FF009900FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            0000868686FF86868686868686868686868600FF008600FF000000FF00FF00FF
            000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF000000FF00FF00FF
            000000FF00FF00FF0000}
          ModalResult = 2
          NumGlyphs = 2
          TabOrder = 9
          OnClick = btnEspCancelarClick
        end
        object chkGuardiaActEsp: TCheckBox
          Left = 35
          Top = 36
          Width = 91
          Height = 17
          Caption = 'Guardia activa'
          TabOrder = 1
          OnClick = chkGuardiaActEspClick
        end
        object chkGuardiaPasEsp: TCheckBox
          Left = 35
          Top = 61
          Width = 91
          Height = 17
          Caption = 'Guardia pasiva'
          TabOrder = 4
          OnClick = chkGuardiaPasEspClick
        end
        object edDesdeActEsp: TMaskEdit
          Left = 140
          Top = 33
          Width = 35
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 2
          Text = '  :  '
        end
        object edDesdePasEsp: TMaskEdit
          Left = 141
          Top = 57
          Width = 35
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 5
          Text = '  :  '
        end
        object edHastaActEsp: TMaskEdit
          Left = 208
          Top = 33
          Width = 35
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 3
          Text = '  :  '
        end
        object edHastaPasEsp: TMaskEdit
          Left = 208
          Top = 57
          Width = 35
          Height = 21
          EditMask = '##:##;1;_'
          MaxLength = 5
          TabOrder = 6
          Text = '  :  '
        end
      end
    end
    object tsNomenclador: TTabSheet
      Caption = 'Valores modulados'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cBarValNomenclador: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = tbarNomenclador
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object tbarNomenclador: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonHeight = 38
          ButtonWidth = 36
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbFiltrarNomenclador: TToolButton
            Left = 0
            Top = 0
            Hint = 'Filtrar Vigencia'
            DropdownMenu = pmuVigenciaValoresNomenclador
            ImageIndex = 16
            Style = tbsDropDown
          end
          object tbAgregarNom: TToolButton
            Tag = 1
            Left = 51
            Top = 0
            Hint = 'Agregar valor (Ctrl+A)'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarNomClick
          end
          object tbEliminarVig: TToolButton
            Left = 87
            Top = 0
            Hint = 'Eliminar Vigencia'
            Caption = 'Eliminar Vigencia'
            ImageIndex = 2
            OnClick = tbEliminarVigClick
          end
          object tbEliminarNom: TToolButton
            Tag = 3
            Left = 123
            Top = 0
            Hint = 'Cerrar Vigencia'
            Caption = 'Cerrar Vigencia'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarNomClick
          end
          object tbAgregarPresup: TToolButton
            Left = 159
            Top = 0
            Hint = 'Agregar presupuesto'
            ImageIndex = 34
            OnClick = tbAgregarPresupClick
          end
          object tbReplicarNom: TToolButton
            Left = 195
            Top = 0
            Hint = 'Replicar valores de la secuencia mandatoria'
            Caption = 'Replicar'
            ImageIndex = 41
            OnClick = tbReplicarNomClick
          end
          object tbIncluirNomenc: TToolButton
            Left = 231
            Top = 0
            Hint = 'Incluir Nomenclador completo'
            Caption = 'tbIncluirNomenc'
            ImageIndex = 24
            Style = tbsCheck
          end
          object tbPracticasPrestador: TToolButton
            Left = 267
            Top = 0
            Hint = 'Pr'#225'cticas del prestador (Ctrl + P)'
            Caption = 'tbPracticasPrestador'
            ImageIndex = 40
            OnClick = tbPracticasPrestadorClick
          end
          object SEP_NOM1: TToolButton
            Left = 303
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarNom: TToolButton
            Left = 311
            Top = 0
            Hint = 'Ordenar (Ctrl+R)'
            Caption = 'tbOrdenarEsp'
            ImageIndex = 5
            OnClick = tbOrdenarNomClick
          end
          object SEP_NOM2: TToolButton
            Left = 347
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarNom: TToolButton
            Left = 355
            Top = 0
            Hint = 'Exportar (Ctrl+X)'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarNomClick
          end
          object tbImprimirNom: TToolButton
            Left = 391
            Top = 0
            Hint = 'Imprimir (Ctrl+M)'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirNomClick
          end
          object ToolButton11: TToolButton
            Left = 427
            Top = 0
            Width = 8
            Caption = 'ToolButton11'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object pnlVigFiltroVM: TPanel
            Left = 435
            Top = 0
            Width = 314
            Height = 38
            Alignment = taRightJustify
            BevelOuter = bvNone
            TabOrder = 0
            object Label89: TLabel
              Left = 19
              Top = 4
              Width = 70
              Height = 13
              Caption = 'Filtrar Vigencia'
            end
            object VigDdeFiltroVM: TDateComboBox
              Left = 98
              Top = 1
              Width = 88
              Height = 21
              MaxDateCombo = VigHtaFiltroVM
              AutoExit = True
              TabOrder = 0
            end
            object VigHtaFiltroVM: TDateComboBox
              Left = 190
              Top = 1
              Width = 88
              Height = 21
              MinDateCombo = VigDdeFiltroVM
              AutoExit = True
              TabOrder = 1
            end
          end
        end
      end
      object dbgValNomenclador: TArtDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 350
        Hint = 'Puede seleccionar m'#250'ltiples pr'#225'cticas'#13#10'para efectuar la baja'
        Align = alClient
        DataSource = dsValNomenclador
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        MultiSelect = True
        OnGetCellParams = dbgValNomencladorGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'VP_NOMENCLADOR'
            Title.Caption = 'Nom.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_CAPITULO'
            Title.Caption = 'Capitulo'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ON_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 211
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VIGENCIADESDE'
            Title.Caption = 'V.Desde'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIGENCIAHASTA'
            Title.Caption = 'V.Hasta'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_MULTIPLICADOR'
            Title.Caption = 'Multip. Honor.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_MULTIGASTOS'
            Title.Caption = 'Multip. Gastos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VALOR'
            Title.Caption = 'Valor Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_ANESTESIA'
            Title.Caption = 'Anestesia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_HIV'
            Title.Caption = 'H.I.V.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_ANTITETANICA'
            Title.Caption = 'Antitet'#225'nica'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_SESIONES'
            Title.Caption = 'Sesiones'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VALORGASTOS'
            Title.Caption = 'V. Gastos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VALORHONORARIOS'
            Title.Caption = 'V. Honorarios'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Caption = 'Siniestro'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_SUMA_FIJA'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_MONTO_MINIMO'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_KM_INCLUIDOS'
            Title.Caption = 'Km Incluidos'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_ABONA_RETORNO'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_DEFAULT'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VALORDEAMP'
            Title.Caption = 'Valor de AMP'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ON_CABECERA'
            Title.Caption = 'Cabecera'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_UNICALIQUIDACION'
            Title.Caption = 'Unica Liquidaci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_USUALTA'
            Title.Caption = 'Usuario Alta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_FECHAALTA'
            Title.Caption = 'Fecha Alta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VIAJE_EXCLUSIVO'
            Title.Caption = 'Viaje Exclusivo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VIAJE_NOCTURNO'
            Title.Caption = 'Viaje Nocturno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_VIAJE_FINDESEMANA'
            Title.Caption = 'Viaje en D'#237'a no h'#225'bil'
            Visible = True
          end>
      end
      object fpABMPresupuesto: TFormPanel
        Left = 176
        Top = 110
        Width = 496
        Height = 179
        Caption = 'Agregar Presupuestos'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        Constraints.MaxHeight = 285
        Constraints.MinHeight = 150
        Constraints.MinWidth = 270
        DesignSize = (
          496
          179)
        object Label39: TLabel
          Left = 8
          Top = 9
          Width = 60
          Height = 13
          Caption = 'Presupuesto'
        end
        object Bevel11: TBevel
          Left = 4
          Top = 30
          Width = 488
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Bevel12: TBevel
          Left = 4
          Top = 140
          Width = 488
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label43: TLabel
          Left = 4
          Top = 41
          Width = 72
          Height = 13
          Caption = 'Vigencia Desde'
        end
        object Label44: TLabel
          Left = 6
          Top = 65
          Width = 70
          Height = 13
          Caption = 'Vigencia Hasta'
        end
        object Label45: TLabel
          Left = 201
          Top = 41
          Width = 43
          Height = 13
          Caption = 'Cantidad'
        end
        object Label40: TLabel
          Left = 220
          Top = 65
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object Label42: TLabel
          Left = 191
          Top = 90
          Width = 53
          Height = 13
          Caption = 'Trabajador'
        end
        inline fraNomencladorPresup: TfraNomenclador
          Left = 72
          Top = 5
          Width = 420
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PopupMenu = fraNomencladorABM.PopupMenu
          TabOrder = 0
          ExplicitLeft = 72
          ExplicitTop = 5
          ExplicitWidth = 420
          ExplicitHeight = 21
          DesignSize = (
            420
            21)
          inherited cmbDescripcion: TLookupComboDlg
            Width = 305
            DataSource = nil
            ExplicitWidth = 305
          end
          inherited ImageList: TImageList
            Bitmap = {
              494C010102005400580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              0000000000003600000028000000400000001000000001002000000000000010
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000808080000000000080808000000
              0000000000000808080000000000080808000000000000000000080808000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000002942420000000000000000000000
              00000000000000000000000000000000000084848400CECECE00CECECE00CECE
              CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
              CE00080808000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000018180000FFFF0063A5A50031525200000000000000
              00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
              0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
              18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
              0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
              E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
              C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
              3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000BDA5
              A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
              EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00080808000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008C00
              0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
              F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
              CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
              0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
              B5000031310039393900000000000000000084848400FFFFFF00003100000031
              00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
              0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
              52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
              FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
              0000080808000000000008080800000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
              F700BDADAD008473000084000000942121002121210021212100000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
              9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
              9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
              2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
              0000000000000000000000000000000000008484840084848400848484008484
              8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
              CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000094393900F7F76B009C843900AD84
              7B00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
              CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000943939007B7B0000AD6B6B000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
              FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
              9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000424D3E000000000000003E000000
              2800000040000000100000000100010000000000800000000000000000000000
              000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
              FC3F000700000000F81F000700000000F80F000700000000F007000700000000
              F003000700000000E001000700000000E001000700000000C003000700000000
              C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
              1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
              000000000000}
          end
        end
        object btnAceptarPresup: TButton
          Left = 361
          Top = 147
          Width = 69
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnAceptarPresupClick
        end
        object edValorPresup: TCurrencyEdit
          Left = 250
          Top = 61
          Width = 53
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          TabOrder = 4
        end
        object dcDesdePresup: TDateComboBox
          Left = 84
          Top = 37
          Width = 88
          Height = 21
          MaxDateCombo = dcHastaPresup
          AutoExit = True
          TabOrder = 1
        end
        object dcHastaPresup: TDateComboBox
          Left = 84
          Top = 61
          Width = 88
          Height = 21
          MinDateCombo = dcDesdePresup
          AutoExit = True
          TabOrder = 2
        end
        object edCantidadPresup: TIntEdit
          Left = 250
          Top = 37
          Width = 52
          Height = 21
          TabOrder = 3
          Text = '1'
          Alignment = taRightJustify
          MaxLength = 3
          MinValue = 1
          Value = 1
        end
        object edTrabajadorPresup: TEdit
          Left = 250
          Top = 86
          Width = 241
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
        end
        object btnCerrarPresup: TButton
          Left = 430
          Top = 147
          Width = 61
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cerrar'
          ModalResult = 2
          TabOrder = 6
        end
        object gbSiniestro: TGroupBox
          Left = 5
          Top = 81
          Width = 173
          Height = 54
          Caption = 'Siniestro'
          TabOrder = 8
          object edSiniestroPresup: TSinEdit
            Left = 6
            Top = 19
            Width = 100
            Height = 21
            OnExit = edSiniestroPresupSelect
            TabOrder = 0
            OnSelect = edSiniestroPresupSelect
          end
          object rgUltSin: TRadioGroup
            Left = 109
            Top = 6
            Width = 60
            Height = 44
            ItemIndex = 0
            Items.Strings = (
              #218'ltimo'
              'Todos')
            TabOrder = 1
          end
        end
      end
      object fpBajaVigencia: TFormPanel
        Left = 456
        Top = 301
        Width = 307
        Height = 285
        Caption = 'Agregar Presupuestos'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        Constraints.MaxHeight = 285
        Constraints.MinHeight = 150
        Constraints.MinWidth = 270
        DesignSize = (
          307
          285)
        object Bevel26: TBevel
          Left = 4
          Top = 246
          Width = 299
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label82: TLabel
          Left = 14
          Top = 13
          Width = 281
          Height = 52
          Caption = 
            'Atenci'#243'n: se dispone a eliminar un valor que est'#225' presente'#13#10'en l' +
            'as siguientes autorizaciones. '#13#10#191'Confirma la baja de dicha vigen' +
            'cia? (Se enviar'#225' un aviso '#13#10'al area m'#233'dica)'
        end
        object Button2: TButton
          Left = 172
          Top = 253
          Width = 61
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ModalResult = 1
          ParentFont = False
          TabOrder = 0
        end
        object Button5: TButton
          Left = 241
          Top = 253
          Width = 61
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object DBGrid1: TDBGrid
          Left = 14
          Top = 76
          Width = 281
          Height = 141
          DataSource = dsBajaVigencia
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'au_siniestro'
              Title.Caption = 'Siniestro'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'au_orden'
              Title.Caption = 'Orden'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'au_recaida'
              Title.Caption = 'Recaida'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'au_numauto'
              Title.Caption = 'N'#176' Auto'
              Width = 56
              Visible = True
            end>
        end
      end
      object fpReplicar: TFormPanel
        Left = 696
        Top = 52
        Width = 541
        Height = 209
        Caption = 'Replicar valores de la secuencia mandatoria'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          541
          209)
        object Bevel28: TBevel
          Left = 4
          Top = 173
          Width = 533
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object GridReplicar: TArtDBGrid
          Left = 10
          Top = 9
          Width = 522
          Height = 156
          DataSource = dsReplicar
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmReplicarVM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = GridReplicarCellClick
          OnDrawColumnCell = GridReplicarDrawColumnCell
          OnKeyDown = GridReplicarKeyDown
          OnGetCellParams = GridReplicarUMGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CHECKBOX'
              Title.Caption = '.'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_NOMENCLADOR'
              Title.Caption = 'Nom.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_CAPITULO'
              Title.Caption = 'Cap.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_CODIGO'
              Title.Caption = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'on_descripcion'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_VIGENCIADESDE'
              Title.Caption = 'Vig. Desde'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_MULTIPLICADOR'
              Title.Caption = 'Multip.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_HONINTERNADOS'
              Title.Caption = 'Honor. Inter.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_HONAMBULATORIOS'
              Title.Caption = 'Honor. Ambul.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_GASTOINTERNADOS'
              Title.Caption = 'Gtos. Intern.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_GASTOAMBULATORIOS'
              Title.Caption = 'Gtos. Ambul.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_VALOR'
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_MULTIGASTOS'
              Title.Caption = 'Multigastos'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_SESIONES'
              Title.Caption = 'Sesiones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_ANTITETANICA'
              Title.Caption = 'Antitet'#225'nica'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_HIV'
              Title.Caption = 'HIV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_ANESTESIA'
              Title.Caption = 'Anestesia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_PSICOLOGICA'
              Title.Caption = 'Psicol'#243'gica'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CA_IDENTIFICADOR'
              Title.Caption = 'ID Prestador'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_IDNOMENCLADOR'
              Title.Caption = 'ID Nomen.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_VALORHONORARIOS'
              Title.Caption = 'Val. Honor.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_VALORGASTOS'
              Title.Caption = 'Val. Gtos.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_DEFAULT'
              Title.Caption = 'Default'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_ABONA_RETORNO'
              Title.Caption = 'Abona Ret.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_SUMA_FIJA'
              Title.Caption = 'Suma Fija'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VP_MONTO_MINIMO'
              Title.Caption = 'Monto M'#237'n.'
              Visible = True
            end>
        end
        object Button6: TButton
          Left = 375
          Top = 180
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 454
          Top = 180
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cerrar'
          ModalResult = 2
          TabOrder = 2
        end
      end
      object fpABMNomenclador: TFormPanel
        Left = 32
        Top = 110
        Width = 481
        Height = 367
        Caption = 'Agregar Valores'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        Position = poOwnerFormCenter
        ActiveControl = fraNomencladorABM.edNomenclador
        Constraints.MaxHeight = 385
        Constraints.MaxWidth = 520
        Constraints.MinHeight = 258
        Constraints.MinWidth = 434
        DesignSize = (
          481
          367)
        object lbNomPrestacion: TLabel
          Left = 8
          Top = 9
          Width = 50
          Height = 13
          Caption = 'Prestacion'
        end
        object bvNomTop: TBevel
          Left = 4
          Top = 30
          Width = 473
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object bvNomBottom: TBevel
          Left = 4
          Top = 330
          Width = 473
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
          ExplicitTop = 287
        end
        object bvNomMid: TBevel
          Left = 4
          Top = 132
          Width = 473
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object lbNomVigDesde: TLabel
          Left = 8
          Top = 40
          Width = 72
          Height = 13
          Caption = 'Vigencia Desde'
        end
        object lbNomVigHasta: TLabel
          Left = 8
          Top = 65
          Width = 70
          Height = 13
          Caption = 'Vigencia Hasta'
        end
        object LblQSesiones: TLabel
          Left = 8
          Top = 111
          Width = 103
          Height = 13
          Caption = 'Cantidad de Sesiones'
        end
        object Label3: TLabel
          Left = 258
          Top = 143
          Width = 68
          Height = 13
          Caption = 'Multip. Gastos'
        end
        object Label49: TLabel
          Left = 116
          Top = 196
          Width = 33
          Height = 13
          Caption = 'Gastos'
        end
        object Label50: TLabel
          Left = 274
          Top = 196
          Width = 52
          Height = 13
          Caption = 'Honorarios'
        end
        object Bevel9: TBevel
          Left = 4
          Top = 228
          Width = 473
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label61: TLabel
          Left = 12
          Top = 242
          Width = 65
          Height = 13
          Caption = 'Monto m'#237'nimo'
        end
        object Label62: TLabel
          Left = 88
          Top = 242
          Width = 44
          Height = 13
          Caption = 'Suma fija'
        end
        object Label63: TLabel
          Left = 40
          Top = 224
          Width = 102
          Height = 13
          Caption = ' M'#243'dulo de traslados '
        end
        object Bevel24: TBevel
          Left = 249
          Top = 109
          Width = 2
          Height = 20
        end
        object Label97: TLabel
          Left = 164
          Top = 242
          Width = 57
          Height = 13
          Caption = 'Km incluidos'
        end
        object Label98: TLabel
          Left = 12
          Top = 282
          Width = 70
          Height = 13
          Caption = 'Viaje Exclusivo'
        end
        object Label99: TLabel
          Left = 88
          Top = 282
          Width = 70
          Height = 13
          Caption = 'Viaje Nocturno'
        end
        object Label100: TLabel
          Left = 164
          Top = 282
          Width = 96
          Height = 13
          Caption = 'Viaje en D'#237'a no h'#225'bil'
        end
        inline fraNomencladorABM: TfraNomenclador
          Left = 64
          Top = 5
          Width = 412
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PopupMenu = fraNomencladorABM.PopupMenu
          TabOrder = 0
          OnExit = fraNomencladorABMExit
          ExplicitLeft = 64
          ExplicitTop = 5
          ExplicitWidth = 412
          ExplicitHeight = 21
          DesignSize = (
            412
            21)
          inherited cmbDescripcion: TLookupComboDlg
            Width = 295
            DataSource = nil
            ExplicitWidth = 295
          end
          inherited ImageList: TImageList
            Bitmap = {
              494C010102005400580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              0000000000003600000028000000400000001000000001002000000000000010
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000808080000000000080808000000
              0000000000000808080000000000080808000000000000000000080808000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000002942420000000000000000000000
              00000000000000000000000000000000000084848400CECECE00CECECE00CECE
              CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
              CE00080808000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000018180000FFFF0063A5A50031525200000000000000
              00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
              0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
              18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
              0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
              E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
              C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
              3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000BDA5
              A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
              EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
              FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
              CE00080808000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008C00
              0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
              F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
              CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
              0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
              B5000031310039393900000000000000000084848400FFFFFF00003100000031
              00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
              CE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
              0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
              52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
              FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
              0000080808000000000008080800000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
              F700BDADAD008473000084000000942121002121210021212100000000000000
              00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
              9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
              9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
              2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
              0000000000000000000000000000000000008484840084848400848484008484
              8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
              CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000094393900F7F76B009C843900AD84
              7B00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
              CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000943939007B7B0000AD6B6B000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
              FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
              9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000424D3E000000000000003E000000
              2800000040000000100000000100010000000000800000000000000000000000
              000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
              FC3F000700000000F81F000700000000F80F000700000000F007000700000000
              F003000700000000E001000700000000E001000700000000C003000700000000
              C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
              1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
              000000000000}
          end
        end
        object edNomMultiplicador: TCurrencyEdit
          Left = 153
          Top = 139
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = ' ,0.0000;- ,0.0000'
          MaxValue = 999.990000000000000000
          MinValue = -999.990000000000000000
          TabOrder = 10
          OnExit = edNomMultiplicadorExit
        end
        object btnNomAceptar: TButton
          Left = 326
          Top = 339
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Caption = '&Agregar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          OnClick = btnNomAceptarClick
        end
        object btnNomCancelar: TButton
          Left = 401
          Top = 339
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cerrar'
          ModalResult = 2
          TabOrder = 27
        end
        object edNomValor: TCurrencyEdit
          Left = 153
          Top = 165
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999999.990000000000000000
          TabOrder = 13
        end
        object rbNomMultiplicador: TRadioButton
          Left = 8
          Top = 143
          Width = 129
          Height = 13
          Caption = '&Multip. Honorarios'
          Checked = True
          TabOrder = 9
          TabStop = True
          OnClick = rbNomOpcionClick
        end
        object rbNomValor: TRadioButton
          Left = 8
          Top = 168
          Width = 77
          Height = 17
          Caption = '&Valor'
          TabOrder = 12
          OnClick = rbNomOpcionClick
        end
        object edValNomVigDesde: TDateComboBox
          Left = 153
          Top = 36
          Width = 88
          Height = 21
          MaxDateCombo = edValNomVigHasta
          AutoExit = True
          TabOrder = 1
        end
        object edValNomVigHasta: TDateComboBox
          Left = 153
          Top = 61
          Width = 88
          Height = 21
          MinDateCombo = edValNomVigDesde
          AutoExit = True
          TabOrder = 2
        end
        object chkAnestesia: TCheckBox
          Left = 153
          Top = 86
          Width = 72
          Height = 17
          Caption = 'Anestesia'
          TabOrder = 4
        end
        object chkHIV: TCheckBox
          Left = 259
          Top = 86
          Width = 54
          Height = 17
          Caption = 'H.I.V.'
          TabOrder = 6
        end
        object edQSesiones: TIntEdit
          Left = 154
          Top = 107
          Width = 84
          Height = 21
          TabOrder = 5
          Text = '1'
          Value = 1
        end
        object edMultiplicadorGs: TCurrencyEdit
          Left = 330
          Top = 139
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = ' ,0.0000;- ,0.0000'
          MaxValue = 999.990000000000000000
          MinValue = -999.990000000000000000
          TabOrder = 11
        end
        object btnPracticas: TBitBtn
          Left = 5
          Top = 339
          Width = 145
          Height = 23
          Anchors = [akLeft, akBottom]
          Caption = 'Practicas del prestador...'
          TabOrder = 25
          OnClick = btnPracticasClick
        end
        object edNomGastos: TCurrencyEdit
          Left = 153
          Top = 191
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          TabOrder = 15
        end
        object rbNomOtros: TRadioButton
          Left = 8
          Top = 195
          Width = 85
          Height = 17
          Caption = '&Otros valores'
          TabOrder = 14
          OnClick = rbNomOpcionClick
        end
        object edNomHonorarios: TCurrencyEdit
          Left = 330
          Top = 191
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          TabOrder = 16
        end
        object edVP_MONTO_MINIMO: TCurrencyEdit
          Left = 8
          Top = 258
          Width = 76
          Height = 21
          Hint = 
            'Es el monto m'#237'nimo que facturar'#225' este prestador por cada traslad' +
            'o.'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
        end
        object edVP_SUMA_FIJA: TCurrencyEdit
          Left = 84
          Top = 258
          Width = 76
          Height = 21
          Hint = 
            'Es la suma fija que se debe adicionar al valor por km de los km ' +
            'excedentes'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
        end
        object chkVP_DEFAULT: TCheckBox
          Left = 232
          Top = 268
          Width = 241
          Height = 17
          Caption = 'Es la prestaci'#243'n predeterminada (valor del km)'
          TabOrder = 21
        end
        object chkVP_ABONA_RETORNO: TCheckBox
          Left = 232
          Top = 252
          Width = 209
          Height = 17
          Caption = 'Tiene permiso para facturar el retorno'
          TabOrder = 20
        end
        object chkValorDeAMP: TCheckBox
          Left = 258
          Top = 110
          Width = 103
          Height = 17
          Caption = 'Valor de AMP'
          TabOrder = 7
        end
        object chkAntitetanica: TCheckBox
          Left = 344
          Top = 85
          Width = 79
          Height = 17
          Caption = 'Antitet'#225'nica'
          TabOrder = 8
        end
        object chkUnicaLiquidacion: TCheckBox
          Left = 259
          Top = 37
          Width = 104
          Height = 17
          Caption = #218'nica Liquidaci'#243'n'
          TabOrder = 3
        end
        object edVP_KM_INCLUIDOS: TCurrencyEdit
          Left = 160
          Top = 258
          Width = 69
          Height = 21
          Hint = 
            'Corresponde a los KM incluidos en el monto m'#237'nimo o en la suma f' +
            'ija'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
        end
        object edVP_VIAJE_EXCLUSIVO: TCurrencyEdit
          Left = 8
          Top = 298
          Width = 76
          Height = 21
          Hint = 
            'Factor multiplicativo que determina si el viaje es EXCLUSIVO (Pa' +
            'ciente que viaja solo)'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 9.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
        end
        object edVP_VIAJE_NOCTURNO: TCurrencyEdit
          Left = 84
          Top = 298
          Width = 76
          Height = 21
          Hint = 
            'Factor multiplicativo que determina si el viaje es NOCTURNO (Pac' +
            'iente que viaja de "noche", despu'#233's de cierto horario)'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 9.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 23
        end
        object edVP_VIAJE_FINDESEMANA: TCurrencyEdit
          Left = 160
          Top = 298
          Width = 69
          Height = 21
          Hint = 
            'Factor multiplicativo que determina si el viaje es durante el FI' +
            'N DE SEMANA (Paciente que viaja durante fin de semana o en d'#237'a f' +
            'eriado)'
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 9.990000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 24
        end
      end
    end
    object tsValoresUnidadesMedicas: TTabSheet
      Caption = 'Valores de U. Medicas'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CoolBar1: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 26
        Bands = <
          item
            Break = False
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 22
            Width = 758
          end>
        object ToolBar1: TToolBar
          Left = 11
          Top = 0
          Width = 749
          Height = 22
          Align = alNone
          ButtonHeight = 38
          ButtonWidth = 36
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbFiltrarValoresUnidMed: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbFiltrarValoresUnidMed'
            DropdownMenu = pmuVigenciaValoresUnidMed
            ImageIndex = 16
            Style = tbsDropDown
          end
          object tbAgregarUMed: TToolButton
            Tag = 1
            Left = 51
            Top = 0
            Hint = 'Agregar (Ctrl+A)'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarUMedClick
          end
          object tbEliminarVigUM: TToolButton
            Left = 87
            Top = 0
            Hint = 'Eliminar Vigencia'
            Caption = 'Eliminar Vigencia'
            ImageIndex = 2
            OnClick = tbEliminarVigUMClick
          end
          object tbEliminarUMed: TToolButton
            Tag = 3
            Left = 123
            Top = 0
            Hint = 'Cerrar Vigencia (Ctrl+E)'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarUMedClick
          end
          object tbReplicarUMed: TToolButton
            Left = 159
            Top = 0
            Hint = 'Replicar valores de la secuencia mandatoria'
            Caption = 'tbReplicarUMed'
            ImageIndex = 41
            OnClick = tbReplicarUMedClick
          end
          object ToolButton3: TToolButton
            Left = 195
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarUMed: TToolButton
            Left = 203
            Top = 0
            Hint = 'Ordenar (Ctrl+R)'
            Caption = 'tbOrdenarEsp'
            ImageIndex = 5
            OnClick = tbOrdenarUMedClick
          end
          object ToolButton6: TToolButton
            Left = 239
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarUMed: TToolButton
            Left = 247
            Top = 0
            Hint = 'Exportar (Ctrl+X)'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarUMedClick
          end
          object tbImprimirUMed: TToolButton
            Left = 283
            Top = 0
            Hint = 'Imprimir (Ctrl+M)'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirUMedClick
          end
          object pnlVigFiltroVUM: TPanel
            Left = 319
            Top = 0
            Width = 314
            Height = 38
            Alignment = taRightJustify
            BevelOuter = bvNone
            TabOrder = 0
            object Label88: TLabel
              Left = 19
              Top = 4
              Width = 70
              Height = 13
              Caption = 'Filtrar Vigencia'
            end
            object VigDdeFiltroVUM: TDateComboBox
              Left = 98
              Top = 1
              Width = 88
              Height = 21
              MaxDateCombo = VigHtaFiltroVUM
              AutoExit = True
              TabOrder = 0
            end
            object VigHtaFiltroVUM: TDateComboBox
              Left = 190
              Top = 1
              Width = 88
              Height = 21
              MinDateCombo = VigDdeFiltroVUM
              AutoExit = True
              TabOrder = 1
            end
          end
        end
      end
      object dBGVUM: TRxDBGrid
        Left = 0
        Top = 26
        Width = 764
        Height = 352
        Align = alClient
        DataSource = DSVUMed
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        MultiSelect = True
        RowColor2 = 16776176
        OnGetCellParams = dBGVUMGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'UP_UNIDAD'
            Title.Caption = 'Unidad'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UM_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_VIGENCIADESDE'
            Title.Caption = 'Vig. Desde'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_VIGENCIAHASTA'
            Title.Caption = 'Vig. Hasta'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_USUALTA'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_FECHAALTA'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_USUMODIF'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UP_FECHAMODIF'
            Width = 67
            Visible = True
          end>
      end
      object fpABMVUMed: TFormPanel
        Left = 132
        Top = 32
        Width = 321
        Height = 165
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsDialog
        Position = poOwnerFormCenter
        DesignSize = (
          321
          165)
        object Bevel7: TBevel
          Left = 4
          Top = 60
          Width = 312
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label5: TLabel
          Left = 12
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Unidad'
        end
        object Label4: TLabel
          Left = 8
          Top = 72
          Width = 72
          Height = 13
          Caption = 'Vigencia Desde'
        end
        object Label6: TLabel
          Left = 104
          Top = 72
          Width = 70
          Height = 13
          Caption = 'Vigencia Hasta'
        end
        object Label7: TLabel
          Left = 196
          Top = 72
          Width = 24
          Height = 13
          Caption = '&Valor'
        end
        object Bevel14: TBevel
          Left = 4
          Top = 122
          Width = 312
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        inline fraUnidad: TfraCodigoDescripcion
          Left = 8
          Top = 32
          Width = 309
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 32
          ExplicitWidth = 309
          DesignSize = (
            309
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 244
            ExplicitWidth = 244
          end
        end
        object Button3: TButton
          Left = 238
          Top = 134
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Salir'
          ModalResult = 2
          TabOrder = 3
        end
        object VigDdeVUM: TDateComboBox
          Left = 8
          Top = 92
          Width = 88
          Height = 21
          MaxDateCombo = VigHtaVUM
          AutoExit = True
          TabOrder = 4
        end
        object VigHtaVUM: TDateComboBox
          Left = 100
          Top = 92
          Width = 88
          Height = 21
          MinDateCombo = VigDdeVUM
          AutoExit = True
          TabOrder = 5
        end
        object edNomValorVUM: TCurrencyEdit
          Left = 192
          Top = 92
          Width = 85
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = ' ,0.0000;- ,0.0000'
          MaxValue = 99999.999900000000000000
          TabOrder = 1
        end
        object CmdAceptarVUM: TButton
          Left = 163
          Top = 134
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = CmdAceptarVUMClick
        end
      end
      object fpReplicarUM: TFormPanel
        Left = 128
        Top = 88
        Width = 541
        Height = 209
        Caption = 'Replicar valores de la secuencia mandatoria'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          541
          209)
        object Bevel30: TBevel
          Left = 4
          Top = 173
          Width = 533
          Height = 5
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object GridReplicarUM: TArtDBGrid
          Left = 10
          Top = 9
          Width = 522
          Height = 156
          DataSource = dsReplicarUM
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmReplicarUM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = GridReplicarUMCellClick
          OnDrawColumnCell = GridReplicarUMDrawColumnCell
          OnKeyDown = GridReplicarKeyDown
          OnGetCellParams = GridReplicarUMGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CHECKBOX'
              Title.Caption = '.'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'up_unidad'
              Title.Caption = 'Unidad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'um_descripcion'
              Title.Caption = 'Descripci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'up_valor'
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'up_vigenciadesde'
              Title.Caption = 'Vig. Desde'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'up_vigenciahasta'
              Title.Caption = 'Vig. Hasta'
              Visible = True
            end>
        end
        object btnAceptarRepUM: TButton
          Left = 375
          Top = 180
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnAceptarRepUMClick
        end
        object Button9: TButton
          Left = 454
          Top = 180
          Width = 75
          Height = 23
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cerrar'
          ModalResult = 2
          TabOrder = 2
        end
      end
    end
    object tsValoresAMP: TTabSheet
      Caption = 'Valores de AMP'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SeparadorPresupuestos: TJvNetscapeSplitter
        Left = 0
        Top = 223
        Width = 764
        Height = 10
        Cursor = crVSplit
        Align = alBottom
        Maximized = False
        Minimized = False
        ButtonCursor = crDefault
        ExplicitTop = 220
        ExplicitWidth = 797
      end
      object pnlDetalleEmpresas: TPanel
        Left = 0
        Top = 197
        Width = 764
        Height = 26
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Detalle de empresas que componen el presupuesto'
        TabOrder = 6
      end
      object GridPresupuestosDetalle: TRxDBGrid
        Left = 0
        Top = 233
        Width = 764
        Height = 145
        Align = alBottom
        DataSource = dsEmpresasPresupuestoAMP
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = GridPresupuestosDetalleCellClick
        RowColor2 = 16776176
        Columns = <
          item
            Expanded = False
            FieldName = 'EM_CUIT'
            Title.Caption = 'C.U.I.T.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Empresa'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_CONTRATO'
            Title.Caption = 'Contrato'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_NROESTABLECI'
            Title.Caption = 'N'#176
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_NOMBRE'
            Title.Caption = 'Establecimiento'
            Width = 167
            Visible = True
          end>
      end
      object CoolBar3: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        AutoSize = True
        Bands = <
          item
            Break = False
            Control = ToolBar3
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        Images = frmPrincipal.ilByN
        object ToolBar3: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alClient
          AutoSize = True
          ButtonWidth = 31
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbFiltrarConv: TToolButton
            Left = 0
            Top = 0
            Hint = 'Filtrar Vigencia'
            DropdownMenu = pmuVigenciaValoresAMP
            ImageIndex = 16
            Style = tbsDropDown
          end
          object tbEliminarVigAMP: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Vigencia'
            Caption = 'tbEliminarVigAMP'
            ImageIndex = 2
            OnClick = tbEliminarVigAMPClick
          end
          object ToolButton10: TToolButton
            Left = 77
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object tbEliminarConv: TToolButton
            Tag = 3
            Left = 85
            Top = 0
            Hint = 'Finalizar Vigencia'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarConvClick
          end
          object ToolButton16: TToolButton
            Left = 116
            Top = 0
            Width = 8
            Caption = 'ToolButton16'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object tbModificarValoresAMP: TToolButton
            Left = 124
            Top = 0
            Hint = 'Fijar valores para el convenio gen'#233'rico'
            Caption = 'Valores AMP (Gen'#233'rico)'
            ImageIndex = 30
            OnClick = tbAgregarConvClick
          end
          object ToolButton12: TToolButton
            Left = 155
            Top = 0
            Width = 8
            Caption = 'ToolButton12'
            Style = tbsSeparator
          end
          object tbAgregarPresupuestoAMP: TToolButton
            Left = 163
            Top = 0
            Hint = 'Agregar presupuesto'
            ImageIndex = 23
            OnClick = tbPresupuestoAMPClick
          end
          object tbModificarPresupuestoAMP: TToolButton
            Left = 194
            Top = 0
            Hint = 'Modificar presupuesto'
            Caption = 'tbModificarPresupuestoAMP'
            ImageIndex = 24
            OnClick = tbPresupuestoAMPClick
          end
          object tbLimpiarPresupuestoAMP: TToolButton
            Left = 225
            Top = 0
            Hint = 'Limpiar Filtros'
            Caption = 'tbLimpiarPresupuestoAMP'
            ImageIndex = 3
            OnClick = tbLimpiarPresupuestoAMPClick
          end
          object ToolButton1: TToolButton
            Left = 256
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarConv: TToolButton
            Left = 264
            Top = 0
            Hint = 'Ordenar'
            ImageIndex = 5
            OnClick = tbOrdenarConvClick
          end
          object tbExportarConv: TToolButton
            Left = 295
            Top = 0
            Hint = 'Exportar'
            ImageIndex = 1
            OnClick = tbExportarConvClick
          end
          object cmbPresupuesto: TJvDBLookupCombo
            Left = 326
            Top = 0
            Width = 347
            Height = 22
            Hint = 'Presupuestos'
            DropDownCount = 20
            DisplayEmpty = '[Gen'#233'rico]'
            LookupField = 'PP_ID'
            LookupDisplay = 'PP_DESCRIPCION'
            LookupSource = dsPresupuestosAMP
            TabOrder = 0
            OnChange = cmbPresupuestoChange
          end
          object tbImprimirConv: TToolButton
            Left = 673
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 7
            OnClick = tbImprimirConvClick
          end
          object pnlLabelPresupuesto: TPanel
            Left = 704
            Top = 0
            Width = 14
            Height = 22
            Alignment = taRightJustify
            BevelOuter = bvNone
            TabOrder = 1
          end
          object tbBajaPresupuesto: TToolButton
            Left = 718
            Top = 0
            Hint = 'Anular presupuesto'
            ImageIndex = 45
            OnClick = tbBajaPresupuestoClick
          end
          object tbSolicitudPresupuestos: TToolButton
            Left = 749
            Top = 0
            Hint = 'Viajar a Solicitud de Presupuestos'
            Caption = 'Solicitud de Presupuestos'
            ImageIndex = 21
            OnClick = tbSolicitudPresupuestosClick
          end
          object tbAprobarPresupuesto: TToolButton
            Left = 780
            Top = 0
            Hint = 'Enviar Presupuesto'
            ImageIndex = 39
            Visible = False
            OnClick = tbAprobarPresupuestoClick
          end
          object tbNotifPresAprob: TToolButton
            Left = 811
            Top = 0
            Hint = 'Notificar Presup. Aprobado'
            Caption = 'Notificar Presup. Aprobado'
            ImageIndex = 39
            OnClick = tbNotifPresAprobClick
          end
          object tbFiltroEmpresaAMP: TToolButton
            Left = 842
            Top = 0
            Hint = 'Filtro Empresa/Establecimiento'
            Caption = 'Filtro Empresa / Establecimiento'
            ImageIndex = 47
            OnClick = tbFiltroEmpresaAMPClick
          end
        end
      end
      object dbgValoresConvenio: TRxDBGrid
        Left = 308
        Top = 147
        Width = 437
        Height = 198
        PopupMenu = pmnuValoresConvenio
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        RowColor2 = 16776176
        Columns = <
          item
            Expanded = False
            FieldName = 'VPID'
            Title.Alignment = taCenter
            Title.Caption = 'Identificador'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 231
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRUBICGEOGRAFICA'
            Title.Caption = 'Ubic. Geogr'#225'fica'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VP_VIGENCIADESDE'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Desde'
            Width = 63
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VP_VIGENCIAHASTA'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Hasta'
            Width = 63
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VP_VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VP_OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 447
            Visible = True
          end>
      end
      object grdAMP: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 169
        Align = alClient
        DataSource = dsValoresPrestador
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmnuValoresConvenio
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        RowColor2 = 16776176
        OnGetCellParams = grdAMPGetCellParams
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'es_codigo'
            Title.Alignment = taCenter
            Title.Caption = 'Identificador'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'es_descripcion'
            Title.Caption = 'Descripci'#243'n'
            Width = 296
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'pd_valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'pd_vigenciadesde'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Desde'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'pd_vigenciahasta'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Hasta'
            Width = 70
            Visible = True
          end>
      end
      object fpValoresPrestaciones: TFormPanel
        Left = 182
        Top = 101
        Width = 740
        Height = 534
        Caption = 'Carga de Valores de Convenios'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        OnClose = fpValoresPrestacionesClose
        OnShow = fpValoresPrestacionesShow
        KeyPreview = True
        Constraints.MinHeight = 500
        Constraints.MinWidth = 740
        DesignSize = (
          740
          534)
        object Bevel6: TBevel
          Left = 0
          Top = 497
          Width = 740
          Height = 37
          Align = alBottom
          Shape = bsTopLine
        end
        object lblCantidadEstudios: TLabel
          Left = 12
          Top = 509
          Width = 101
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Cantidad de estudios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNroEstudio: TLabel
          Left = 280
          Top = 509
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Nro de estudio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnAceptarDatosPrestaciones: TButton
          Left = 582
          Top = 504
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnAceptarDatosPrestacionesClick
        end
        object btnCancelarDatosPrestaciones: TButton
          Left = 660
          Top = 504
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ModalResult = 2
          ParentFont = False
          TabOrder = 4
        end
        object pnlDatosAMP: TPanel
          Left = 0
          Top = 269
          Width = 740
          Height = 96
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            740
            96)
          object Label31: TLabel
            Left = 512
            Top = 70
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Fecha Vigencia Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object spbAsignarDatos: TSpeedButton
            Left = 702
            Top = 40
            Width = 23
            Height = 22
            Hint = 'Asignar el valor y fecha a los'#13#10'Estudios seleccionados'
            Anchors = [akTop, akRight]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbAsignarDatosClick
          end
          object Label34: TLabel
            Left = 517
            Top = 44
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Valor de prestaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edVigencia: TDateComboBox
            Left = 614
            Top = 67
            Width = 88
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Anchors = [akTop, akRight]
            ParentFont = False
            TabOrder = 2
          end
          object edValorPres: TRxCalcEdit
            Left = 614
            Top = 41
            Width = 86
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 0
            Anchors = [akTop, akRight]
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 1
          end
          object gbViaticos: TGroupBox
            Left = 13
            Top = 2
            Width = 348
            Height = 91
            Caption = ' Vi'#225'ticos '
            TabOrder = 0
            object Label28: TLabel
              Left = 12
              Top = 18
              Width = 79
              Height = 13
              Caption = 'por KM recorrido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 12
              Top = 42
              Width = 87
              Height = 13
              Caption = 'por D'#237'a de estad'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 195
              Top = 18
              Width = 52
              Height = 13
              Caption = 'a partir del'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 195
              Top = 42
              Width = 52
              Height = 13
              Caption = 'a partir del'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label78: TLabel
              Left = 195
              Top = 66
              Width = 52
              Height = 13
              Caption = 'a partir del'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label80: TLabel
              Left = 12
              Top = 66
              Width = 96
              Height = 13
              Caption = 'por Gastos de env'#237'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edViaticoKM: TRxCalcEdit
              Left = 112
              Top = 15
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 0
            end
            object edViaticoEstadia: TRxCalcEdit
              Left = 112
              Top = 39
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 2
            end
            object edFechaViaticoKM: TDateComboBox
              Left = 252
              Top = 15
              Width = 88
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edFechaViaticoEstadia: TDateComboBox
              Left = 252
              Top = 39
              Width = 88
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edFechaViaticoGastoEnvio: TDateComboBox
              Left = 252
              Top = 63
              Width = 88
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object edViaticoGastoEnvio: TRxCalcEdit
              Left = 112
              Top = 63
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 4
            end
          end
          object chkViatico: TCheckBox
            Left = 380
            Top = 10
            Width = 109
            Height = 17
            Caption = 'Vi'#225'tico Bonificado'
            TabOrder = 3
            OnClick = chkViaticoClick
          end
        end
        object pnlTopAMP: TPanel
          Left = 0
          Top = 0
          Width = 740
          Height = 269
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            740
            269)
          object lbNroPresupuesto: TLabel
            Left = 12
            Top = 76
            Width = 36
            Height = 23
            Caption = 'Nro.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label57: TLabel
            Left = 12
            Top = 52
            Width = 102
            Height = 23
            Caption = 'Presupuesto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object chkPresupuestoAMP: TCheckBox
            Left = 12
            Top = 8
            Width = 160
            Height = 17
            Caption = 'Pertenece a un presupuesto'
            Enabled = False
            TabOrder = 0
            OnClick = chkPresupuestoAMPClick
          end
          object gbDatosPresupuesto: TGroupBox
            Left = 12
            Top = 108
            Width = 718
            Height = 153
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Datos del presupuesto '
            TabOrder = 2
            DesignSize = (
              718
              153)
            object Label46: TLabel
              Left = 9
              Top = 100
              Width = 30
              Height = 13
              Caption = 'Desde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 136
              Top = 100
              Width = 28
              Height = 13
              Caption = 'Hasta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label48: TLabel
              Left = 260
              Top = 100
              Width = 54
              Height = 13
              Caption = 'Descripci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label55: TLabel
              Left = 8
              Top = 128
              Width = 79
              Height = 13
              Caption = 'por KM recorrido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label56: TLabel
              Left = 164
              Top = 128
              Width = 86
              Height = 13
              Caption = 'por d'#237'a de estad'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label58: TLabel
              Left = 333
              Top = 128
              Width = 117
              Height = 13
              Caption = 'Solicitud de Presupuesto'
            end
            object Label59: TLabel
              Left = 8
              Top = 24
              Width = 24
              Height = 13
              Caption = 'CUIT'
            end
            inline fraEmpresaPresupuestoAMP: TfraEmpresa
              Left = 42
              Top = 20
              Width = 668
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ExplicitLeft = 42
              ExplicitTop = 20
              ExplicitWidth = 668
              ExplicitHeight = 21
              DesignSize = (
                668
                21)
              inherited lbContrato: TLabel
                Left = 564
                ExplicitLeft = 564
              end
              inherited mskCUIT: TMaskEdit
                Font.Name = 'MS Sans Serif'
                ParentFont = False
              end
              inherited edContrato: TIntEdit
                Left = 609
                Font.Name = 'MS Sans Serif'
                ParentFont = False
                ExplicitLeft = 609
              end
              inherited cmbRSocial: TArtComboBox
                Width = 428
                Font.Name = 'MS Sans Serif'
                ParentFont = False
                ExplicitWidth = 428
              end
            end
            object edPP_VIGENCIADESDE: TDateComboBox
              Left = 42
              Top = 96
              Width = 88
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edPP_VIGENCIAHASTA: TDateComboBox
              Left = 168
              Top = 96
              Width = 88
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edPP_DESCRIPCION: TEdit
              Left = 317
              Top = 96
              Width = 390
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 4
            end
            object edValorKM_Presupuesto: TRxCalcEdit
              Left = 93
              Top = 125
              Width = 65
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 5
            end
            object edValorEstadia_Presupuesto: TRxCalcEdit
              Left = 255
              Top = 125
              Width = 65
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 6
            end
            object btnAgregarEmpresa: TButton
              Left = 564
              Top = 122
              Width = 143
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Agregar otra empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              OnClick = btnAgregarEmpresaClick
            end
            object lupSolicitudPresupuesto: TJvDBLookupCombo
              Left = 456
              Top = 125
              Width = 88
              Height = 22
              DropDownCount = 20
              DisplayEmpty = '[Ninguna]'
              LookupField = 'SP_ID'
              LookupDisplay = 'SP_ID'
              LookupSource = dsSolicitudPresupuesto
              TabOrder = 7
            end
            inline fraPP_IDESTABLECIMIENTO: TfraEstablecimiento
              Left = 6
              Top = 45
              Width = 703
              Height = 48
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ExplicitLeft = 6
              ExplicitTop = 45
              ExplicitWidth = 703
              ExplicitHeight = 48
              DesignSize = (
                703
                48)
              inherited lbLocalidad: TLabel
                Left = 453
                ExplicitLeft = 453
              end
              inherited lbCPostal: TLabel
                Left = 632
                ExplicitLeft = 632
              end
              inherited lbProvincia: TLabel
                Left = 453
                ExplicitLeft = 453
              end
              inherited cmbDescripcion: TArtComboBox
                Width = 366
                ExplicitWidth = 366
              end
              inherited edLocalidad: TEdit
                Left = 505
                Width = 124
                ExplicitLeft = 505
                ExplicitWidth = 124
              end
              inherited edCPostal: TEdit
                Left = 656
                ExplicitLeft = 656
              end
              inherited edDomicilio: TEdit
                Width = 396
                ExplicitWidth = 396
              end
              inherited edProvincia: TEdit
                Left = 505
                Width = 196
                ExplicitLeft = 505
                ExplicitWidth = 196
              end
              inherited sdqDatos: TSDQuery
                Top = 52
              end
              inherited dsDatos: TDataSource
                Top = 52
              end
            end
          end
          object chkNuevoAMP: TCheckBox
            Left = 12
            Top = 29
            Width = 145
            Height = 17
            Caption = 'Nuevo presupuesto'
            Enabled = False
            TabOrder = 1
          end
          object GridEmpresas: TRxDBGrid
            Left = 176
            Top = 5
            Width = 554
            Height = 104
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsEmpresasPresupuestoAMP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GridEmpresasCellClick
            RowColor2 = 16776176
            Columns = <
              item
                Expanded = False
                FieldName = 'EM_CUIT'
                Title.Alignment = taCenter
                Title.Caption = 'C.U.I.T.'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EM_NOMBRE'
                Title.Alignment = taCenter
                Title.Caption = 'Empresa'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_CONTRATO'
                Title.Alignment = taCenter
                Title.Caption = 'Contrato'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_NOMBRE'
                Title.Alignment = taCenter
                Title.Caption = 'Establecimiento'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_NROESTABLECI'
                Title.Alignment = taCenter
                Title.Caption = 'N'#176
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pp_idsolicitud'
                Title.Caption = 'Solicitud'
                Visible = True
              end>
          end
        end
        object grdEstudios: TArtDBGrid
          Left = 0
          Top = 365
          Width = 740
          Height = 132
          Hint = 
            'Puede asignar grupalmente el valor de la prestaci'#243'n y su fecha d' +
            'e vigencia '#13#10'haciendo una selecci'#243'n multiple en la grilla'#13#10#13#10'Adi' +
            'cionalmente puede ordenar los datos haciendo click sobre el t'#237'tu' +
            'lo en la grilla.'
          Align = alClient
          DataSource = dsValoresPrestaciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          PopupMenu = pmuValoresAMP
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyPress = grdEstudiosKeyPress
          MultiSelect = True
          TitleButtons = True
          OnGetCellParams = grdEstudiosGetCellParams
          OnTitleBtnClick = grdEstudiosTitleBtnClick
          TitleHeight = 17
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'es_codigo'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'es_descripcion'
              Title.Alignment = taCenter
              Title.Caption = 'Descripci'#243'n'
              Width = 419
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pd_valor'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'pd_vigenciadesde'
              Title.Alignment = taCenter
              Title.Caption = 'Vigencia desde'
              Width = 90
              Visible = True
            end>
        end
      end
      object fpVigenciaHasta: TFormPanel
        Left = -147
        Top = 273
        Width = 220
        Height = 90
        Caption = 'Vigencia Valor AMP'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        Constraints.MaxHeight = 90
        Constraints.MaxWidth = 220
        Constraints.MinHeight = 90
        Constraints.MinWidth = 220
        DesignSize = (
          220
          90)
        object Bevel18: TBevel
          Left = 4
          Top = 54
          Width = 212
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label37: TLabel
          Left = 26
          Top = 22
          Width = 70
          Height = 13
          Caption = 'Vigencia Hasta'
        end
        object btnAceptarVigencia: TButton
          Left = 62
          Top = 60
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnAceptarVigenciaClick
        end
        object Button4: TButton
          Left = 140
          Top = 60
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object dedVigenciaHasta: TDateComboBox
          Left = 105
          Top = 18
          Width = 88
          Height = 21
          AutoExit = True
          TabOrder = 2
        end
      end
      object fpFiltroEmpresaAMP: TFormPanel
        Left = 571
        Top = 96
        Width = 694
        Height = 149
        Caption = 'Filtro Empresa/Establecimiento'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = []
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        DesignSize = (
          694
          149)
        object Bevel33: TBevel
          Left = 4
          Top = 113
          Width = 686
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnAceptarFiltroEmpAMP: TButton
          Left = 536
          Top = 119
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          ModalResult = 1
          TabOrder = 0
          OnClick = btnAceptarFiltroEmpAMPClick
        end
        object btnCancelarFiltroEmpAMP: TButton
          Left = 614
          Top = 119
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object gbFiltroEmpresaAMP: TGroupBox
          Left = 6
          Top = 5
          Width = 682
          Height = 104
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Empresa / Establecimiento'
          TabOrder = 2
          DesignSize = (
            682
            104)
          object Label41: TLabel
            Left = 8
            Top = 24
            Width = 24
            Height = 13
            Caption = 'CUIT'
          end
          inline fraEmpresaFiltroAMP: TfraEmpresa
            Left = 42
            Top = 20
            Width = 632
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ExplicitLeft = 42
            ExplicitTop = 20
            ExplicitWidth = 632
            ExplicitHeight = 21
            DesignSize = (
              632
              21)
            inherited lbContrato: TLabel
              Left = 528
              ExplicitLeft = 528
            end
            inherited mskCUIT: TMaskEdit
              Font.Name = 'MS Sans Serif'
              ParentFont = False
            end
            inherited edContrato: TIntEdit
              Left = 575
              Font.Name = 'MS Sans Serif'
              ParentFont = False
              ExplicitLeft = 575
            end
            inherited cmbRSocial: TArtComboBox
              Width = 393
              Font.Name = 'MS Sans Serif'
              ParentFont = False
              ExplicitWidth = 393
            end
          end
          object RxCalcEdit1: TRxCalcEdit
            Left = 255
            Top = 125
            Width = 65
            Height = 21
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ButtonWidth = 0
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 2
          end
          inline fraEstablecimientoFiltroAMP: TfraEstablecimiento
            Left = 6
            Top = 45
            Width = 667
            Height = 48
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 6
            ExplicitTop = 45
            ExplicitWidth = 667
            ExplicitHeight = 48
            DesignSize = (
              667
              48)
            inherited lbLocalidad: TLabel
              Left = 403
              ExplicitLeft = 403
            end
            inherited lbCPostal: TLabel
              Left = 596
              ExplicitLeft = 596
            end
            inherited lbProvincia: TLabel
              Left = 406
              ExplicitLeft = 406
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 312
              ExplicitWidth = 312
            end
            inherited edLocalidad: TEdit
              Left = 451
              Width = 139
              ExplicitLeft = 451
              ExplicitWidth = 139
            end
            inherited edCPostal: TEdit
              Left = 620
              Width = 47
              ExplicitLeft = 620
              ExplicitWidth = 47
            end
            inherited edDomicilio: TEdit
              Width = 341
              ExplicitWidth = 341
            end
            inherited edProvincia: TEdit
              Left = 451
              Width = 216
              ExplicitLeft = 451
              ExplicitWidth = 216
            end
            inherited sdqDatos: TSDQuery
              Top = 52
            end
            inherited dsDatos: TDataSource
              Top = 52
            end
          end
        end
      end
    end
    object tsEmpresas: TTabSheet
      Caption = 'Empresas'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CoolBar2: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = ToolBar2
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object ToolBar2: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonHeight = 24
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarEmpresa: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarEmpresaClick
          end
          object tbModificarEmpresa: TToolButton
            Left = 24
            Top = 0
            Hint = 'Modificar'
            ImageIndex = 24
            OnClick = tbModificarEmpresaClick
          end
          object tbEliminarEmpresa: TToolButton
            Tag = 3
            Left = 48
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarEmpresaClick
          end
          object ToolButton4: TToolButton
            Left = 72
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarEmpresa: TToolButton
            Left = 80
            Top = 0
            Hint = 'Ordenar'
            Caption = 'tbOrdenarEsp'
            ImageIndex = 5
            OnClick = tbOrdenarEmpresaClick
          end
          object ToolButton9: TToolButton
            Left = 104
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarEmpresa: TToolButton
            Left = 112
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarEmpresaClick
          end
          object tbImprimirEmpresa: TToolButton
            Left = 136
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirEmpresaClick
          end
        end
      end
      object dbgEmpresas: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 350
        Align = alClient
        DataSource = dsEmpresas
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgEmpresasDblClick
        IniStorage = FormPlacement
        RowColor2 = 16776176
        OnGetCellParams = dbgEmpresasGetCellParams
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'Raz'#243'n Social'
            Width = 190
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'V_DESDE'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Desde'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'V_HASTA'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Hasta'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 365
            Visible = True
          end>
      end
      object fpDialogEmpresas: TFormPanel
        Left = 96
        Top = 96
        Width = 576
        Height = 215
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        Constraints.MinHeight = 215
        Constraints.MinWidth = 576
        DesignSize = (
          576
          215)
        object BevelAbm: TBevel
          Left = 4
          Top = 179
          Width = 568
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object lbVigenciaDesdeEmp: TLabel
          Left = 8
          Top = 42
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Vigencia Desde'
        end
        object lbVigenciaHastaEmp: TLabel
          Left = 8
          Top = 66
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Vigencia Hasta'
        end
        object lbObservacionesEmp: TLabel
          Left = 8
          Top = 92
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Observaciones'
        end
        object Label60: TLabel
          Left = 8
          Top = 16
          Width = 24
          Height = 13
          Caption = 'CUIT'
        end
        object btnAceptarEmpresas: TButton
          Left = 418
          Top = 185
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnAceptarEmpresasClick
        end
        object btnCancelarEmpresas: TButton
          Left = 496
          Top = 185
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        inline fraEmpresaEmp: TfraEmpresa
          Left = 40
          Top = 11
          Width = 529
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ExplicitLeft = 40
          ExplicitTop = 11
          ExplicitWidth = 529
          ExplicitHeight = 21
          DesignSize = (
            529
            21)
          inherited lbRSocial: TLabel
            Left = 87
            ExplicitLeft = 87
          end
          inherited lbContrato: TLabel
            Left = 425
            ExplicitLeft = 425
          end
          inherited edContrato: TIntEdit
            Left = 470
            ExplicitLeft = 470
          end
          inherited cmbRSocial: TArtComboBox
            Left = 128
            Width = 292
            ExplicitLeft = 128
            ExplicitWidth = 292
          end
        end
        object edVigenciaDesdeEmp: TDateComboBox
          Left = 88
          Top = 38
          Width = 88
          Height = 21
          MaxDateCombo = edVigenciaHastaEmp
          TabOrder = 1
        end
        object edVigenciaHastaEmp: TDateComboBox
          Left = 88
          Top = 64
          Width = 88
          Height = 21
          MinDateCombo = edVigenciaDesdeEmp
          TabOrder = 2
        end
        object edObservacionesEmp: TMemo
          Left = 88
          Top = 90
          Width = 480
          Height = 84
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 250
          TabOrder = 3
        end
      end
    end
    object tsContratos: TTabSheet
      Caption = 'Legajo'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CoolBar4: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = ToolBar4
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object ToolBar4: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonHeight = 24
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbFiltrarContratos: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbFiltrarContratos'
            DropdownMenu = pmuFiltrarContratos
            ImageIndex = 16
            Style = tbsDropDown
          end
          object tbAgregarContrato: TToolButton
            Tag = 1
            Left = 39
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarContratoClick
          end
          object tbModificarContrato: TToolButton
            Left = 63
            Top = 0
            Hint = 'Modificar'
            ImageIndex = 24
            OnClick = tbModificarContratoClick
          end
          object tbEliminarContrato: TToolButton
            Left = 87
            Top = 0
            Caption = 'tbEliminarContrato'
            ImageIndex = 25
            OnClick = tbEliminarContratoClick
          end
          object ToolButton13: TToolButton
            Left = 111
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarContrato: TToolButton
            Left = 119
            Top = 0
            Hint = 'Ordenar'
            Caption = 'tbOrdenarContratos'
            ImageIndex = 5
            OnClick = tbOrdenarContratoClick
          end
          object ToolButton15: TToolButton
            Left = 143
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarContrato: TToolButton
            Left = 151
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarContratoClick
          end
          object tbImprimirContrato: TToolButton
            Left = 175
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirContratoClick
          end
        end
      end
      object dbgContratos: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 183
        Align = alClient
        DataSource = dsContratos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgContratosCellClick
        OnDblClick = dbgContratosDblClick
        IniStorage = FormPlacement
        RowColor2 = 16776176
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PC_VIGENCIADESDE'
            Title.Alignment = taCenter
            Title.Caption = 'Vigencia desde'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PC_VIGENCIAHASTA'
            Title.Alignment = taCenter
            Title.Caption = 'Vigencia hasta'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCCONTRATO'
            Title.Caption = 'Tipo contrato'
            Width = 85
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 211
        Width = 764
        Height = 167
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          764
          167)
        object Label12: TLabel
          Left = 111
          Top = 16
          Width = 57
          Height = 13
          Caption = 'Fact. desde'
        end
        object Label13: TLabel
          Left = 111
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Plazo refact.'
        end
        object Label18: TLabel
          Left = 111
          Top = 44
          Width = 55
          Height = 13
          Caption = 'Fact. hasta'
        end
        object lbHasta: TLabel
          Left = 11
          Top = 43
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vig. hasta'
        end
        object lbDesde: TLabel
          Left = 10
          Top = 7
          Width = 50
          Height = 13
          Caption = 'Vig. desde'
        end
        object Label14: TLabel
          Left = 8
          Top = 80
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object edFacturaDesde: TIntEdit
          Left = 176
          Top = 12
          Width = 49
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
          MaxLength = 2
        end
        object edPlazoRefacturacion: TIntEdit
          Left = 176
          Top = 68
          Width = 49
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
          MaxLength = 2
        end
        object edFacturaHasta: TIntEdit
          Left = 176
          Top = 40
          Width = 49
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
          MaxLength = 2
        end
        object edVigenciaDesdeCont: TDateComboBox
          Left = 9
          Top = 21
          Width = 86
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object edVigenciaHastaCont: TDateComboBox
          Left = 10
          Top = 56
          Width = 86
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object chkSumaModulos: TCheckBox
          Left = 686
          Top = 76
          Width = 89
          Height = 17
          TabStop = False
          Caption = 'Suma m'#243'dulos'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsStrikeOut]
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object chkMedicacionExtra: TCheckBox
          Left = 686
          Top = 60
          Width = 103
          Height = 17
          TabStop = False
          Caption = 'Medicaci'#243'n extra'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsStrikeOut]
          ParentFont = False
          TabOrder = 5
          Visible = False
        end
        object edObservacionesContrato: TMemo
          Left = 5
          Top = 96
          Width = 754
          Height = 66
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          MaxLength = 4000
          ReadOnly = True
          TabOrder = 14
        end
        object chkRenovAutomatica: TCheckBox
          Left = 247
          Top = 12
          Width = 104
          Height = 17
          Caption = 'Renov. auto.'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object chkDocumento: TCheckBox
          Left = 247
          Top = 32
          Width = 101
          Height = 17
          Caption = 'Documento'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object chkContratoSocial: TCheckBox
          Left = 247
          Top = 52
          Width = 105
          Height = 17
          Caption = 'Estatuto'
          Enabled = False
          TabOrder = 9
        end
        object chkActaAutoridades: TJvCheckBox
          Left = 247
          Top = 72
          Width = 117
          Height = 17
          Caption = 'Acta / Poder'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          WordWrap = True
          LinkedControls = <>
          AutoSize = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object chkCV: TCheckBox
          Left = 365
          Top = 12
          Width = 78
          Height = 17
          Caption = 'CV'
          Enabled = False
          TabOrder = 11
        end
        object chkTitulo: TCheckBox
          Left = 365
          Top = 32
          Width = 78
          Height = 17
          Caption = 'T'#237'tulo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object chkMatricula: TCheckBox
          Left = 365
          Top = 52
          Width = 88
          Height = 17
          Caption = 'Matr'#237'cula'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object dcContSoc1: TDateComboBox
          Left = 688
          Top = 3
          Width = 88
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = False
        end
        object dcActaDesig1: TDateComboBox
          Left = 688
          Top = 29
          Width = 88
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          Visible = False
        end
        object chkHabilitado: TCheckBox
          Left = 474
          Top = 52
          Width = 88
          Height = 17
          Hint = 'Habilitaci'#243'n'
          Caption = 'Habilitaci'#243'n'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          WordWrap = True
        end
        object chkRespCivil: TCheckBox
          Left = 474
          Top = 32
          Width = 96
          Height = 17
          Caption = 'Resp. Civil'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          WordWrap = True
        end
        object chkComplejidad: TCheckBox
          Left = 365
          Top = 72
          Width = 99
          Height = 17
          Hint = 'Complejidad'
          Caption = 'Complejidad'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          WordWrap = True
        end
        object chkCartaCompromiso: TCheckBox
          Left = 474
          Top = 12
          Width = 99
          Height = 17
          Hint = 'Carta Compromiso'
          Caption = 'Carta Comp.'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 20
          WordWrap = True
        end
        object cmbFechaVtoHabilitacion: TDateComboBox
          Left = 578
          Top = 50
          Width = 89
          Height = 21
          Hint = 'Fecha de vencimiento de la Habilitaci'#243'n'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 21
        end
        object cmbFechaRespCivil: TDateComboBox
          Left = 578
          Top = 27
          Width = 89
          Height = 21
          Hint = 'Fecha de '#250'ltima revisi'#243'n de Responsabilidad Civil'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
        end
      end
      object fpABMContratos: TFormPanel
        Left = 164
        Top = 216
        Width = 725
        Height = 274
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsDialog
        Position = poOwnerFormCenter
        DesignSize = (
          725
          274)
        object Bevel15: TBevel
          Left = 6
          Top = 32
          Width = 713
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label16: TLabel
          Left = 6
          Top = 44
          Width = 71
          Height = 13
          Caption = 'Vigencia desde'
        end
        object Label19: TLabel
          Left = 6
          Top = 72
          Width = 69
          Height = 13
          Caption = 'Vigencia hasta'
        end
        object Bevel16: TBevel
          Left = 6
          Top = 96
          Width = 712
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label17: TLabel
          Left = 6
          Top = 10
          Width = 64
          Height = 13
          Caption = 'Tipo contrato'
        end
        object Label15: TLabel
          Left = 273
          Top = 109
          Width = 92
          Height = 13
          Caption = 'Plazo refacturaci'#243'n'
        end
        object Label20: TLabel
          Left = 142
          Top = 109
          Width = 67
          Height = 13
          Caption = 'Factura hasta'
        end
        object Label21: TLabel
          Left = 6
          Top = 109
          Width = 69
          Height = 13
          Caption = 'Factura desde'
        end
        object Label22: TLabel
          Left = 6
          Top = 138
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Bevel17: TBevel
          Left = 6
          Top = 133
          Width = 712
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object btnAceptarContrato: TButton
          Left = 568
          Top = 243
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          OnClick = btnAceptarContratoClick
        end
        object btnCancelarContrato: TButton
          Left = 643
          Top = 243
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 17
        end
        object edVigDesdeABM: TDateComboBox
          Left = 83
          Top = 40
          Width = 88
          Height = 21
          MaxDateCombo = edVigHastaABM
          AutoExit = True
          TabOrder = 1
        end
        object edVigHastaABM: TDateComboBox
          Left = 83
          Top = 68
          Width = 88
          Height = 21
          MinDateCombo = edVigDesdeABM
          AutoExit = True
          TabOrder = 2
        end
        inline fraTipoContratoABM: TfraCtbTablas
          Left = 83
          Top = 5
          Width = 238
          Height = 23
          TabOrder = 0
          ExplicitLeft = 83
          ExplicitTop = 5
          ExplicitWidth = 238
          DesignSize = (
            238
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 185
            ExplicitWidth = 185
          end
        end
        object chkMedExtraABM: TCheckBox
          Left = 352
          Top = 8
          Width = 105
          Height = 17
          TabStop = False
          Caption = 'Medicaci'#243'n extra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsStrikeOut]
          ParentFont = False
          TabOrder = 3
          Visible = False
        end
        object chkSumaModulosABM: TCheckBox
          Left = 468
          Top = 8
          Width = 93
          Height = 17
          TabStop = False
          Caption = 'Suma m'#243'dulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsStrikeOut]
          ParentFont = False
          TabOrder = 4
          Visible = False
        end
        object edFactDesdeABM: TIntEdit
          Left = 83
          Top = 105
          Width = 49
          Height = 21
          TabOrder = 12
          MaxLength = 2
          MaxValue = 31
        end
        object edFactHastaABM: TIntEdit
          Left = 214
          Top = 105
          Width = 49
          Height = 21
          TabOrder = 13
          MaxLength = 2
          MaxValue = 31
        end
        object edPLazoRefacABM: TIntEdit
          Left = 369
          Top = 105
          Width = 49
          Height = 21
          TabOrder = 14
          MaxLength = 2
        end
        object edObservABM: TMemo
          Left = 6
          Top = 155
          Width = 712
          Height = 81
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 4000
          TabOrder = 15
        end
        object chkRenovAutomABM: TCheckBox
          Left = 176
          Top = 40
          Width = 133
          Height = 17
          Caption = 'Renovaci'#243'n autom'#225'tica'
          TabOrder = 5
        end
        object chkDocumentoABM: TCheckBox
          Left = 176
          Top = 56
          Width = 77
          Height = 17
          Caption = 'Documento'
          TabOrder = 6
        end
        object chkContratoSocialABM: TCheckBox
          Left = 176
          Top = 72
          Width = 105
          Height = 17
          Caption = 'Estatuto'
          TabOrder = 7
          OnClick = chkContratoSocialABMClick
        end
        object chkActaAutoridadesABM: TJvCheckBox
          Left = 322
          Top = 40
          Width = 93
          Height = 17
          Caption = 'Acta / Poder'
          TabOrder = 8
          WordWrap = True
          OnClick = chkActaAutoridadesABMClick
          LinkedControls = <>
          AutoSize = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object chkCVABM: TCheckBox
          Left = 322
          Top = 56
          Width = 78
          Height = 17
          Caption = 'CV'
          TabOrder = 9
        end
        object chkTituloABM: TCheckBox
          Left = 322
          Top = 72
          Width = 78
          Height = 17
          Caption = 'T'#237'tulo'
          TabOrder = 10
        end
        object chkMatriculaABM: TCheckBox
          Left = 417
          Top = 40
          Width = 78
          Height = 17
          Caption = 'Matr'#237'cula'
          TabOrder = 11
        end
        object dcContSoc: TDateComboBox
          Left = 564
          Top = 113
          Width = 88
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          Visible = False
        end
        object dcActaDesig: TDateComboBox
          Left = 468
          Top = 111
          Width = 88
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
        end
        object chkhabilitadoABM: TCheckBox
          Left = 537
          Top = 40
          Width = 78
          Height = 17
          Hint = 'Habilitaci'#243'n'
          Anchors = [akTop, akRight]
          Caption = 'Habilitaci'#243'n'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 20
          WordWrap = True
          OnClick = chkhabilitadoABMClick
        end
        object chkRespCivilABM: TCheckBox
          Left = 537
          Top = 56
          Width = 76
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Resp. Civil'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 21
          WordWrap = True
          OnClick = chkRespCivilABMClick
        end
        object chkComplejidadABM: TCheckBox
          Left = 417
          Top = 56
          Width = 78
          Height = 17
          Hint = 'Complejidad'
          Anchors = [akTop, akRight]
          Caption = 'Complejidad'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
          WordWrap = True
        end
        object chkCartaCompromisoABM: TCheckBox
          Left = 417
          Top = 72
          Width = 111
          Height = 17
          Hint = 'Carta Compromiso'
          Anchors = [akTop, akRight]
          Caption = 'Carta Compromiso'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 23
          WordWrap = True
        end
        object cmbFechaVtoHabilitacionABM: TDateComboBox
          Left = 628
          Top = 36
          Width = 89
          Height = 21
          Hint = 'Fecha de '#250'ltima revisi'#243'n de Responsabilidad Civil'
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 24
        end
        object cmbFechaRespCivilABM: TDateComboBox
          Left = 628
          Top = 58
          Width = 89
          Height = 21
          Hint = 'Fecha de vencimiento de la Habilitaci'#243'n'
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 25
        end
      end
    end
    object tsCPActividad: TTabSheet
      Caption = 'Codigos postales AMP'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ToolBar5: TToolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 24
        ButtonWidth = 24
        Caption = 'ToolBar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbModificarCP: TToolButton
          Left = 0
          Top = 0
          Hint = 'Modificar'
          ImageIndex = 24
          OnClick = tbModificarCPClick
        end
        object tbEliminarCP: TToolButton
          Tag = 3
          Left = 24
          Top = 0
          Hint = 'Eliminar'
          ImageIndex = 25
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEliminarCPClick
        end
        object ToolButton14: TToolButton
          Left = 48
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object tbOrdenarCP: TToolButton
          Left = 56
          Top = 0
          Hint = 'Ordenar'
          Caption = 'tbOrdenarEsp'
          ImageIndex = 5
          OnClick = tbOrdenarCPClick
        end
        object ToolButton17: TToolButton
          Left = 80
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object tbExportarCP: TToolButton
          Left = 88
          Top = 0
          Hint = 'Exportar'
          Caption = 'tbExportarEsp'
          ImageIndex = 1
          OnClick = tbExportarCPClick
        end
        object tbImprimirCP: TToolButton
          Left = 112
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbImprimirEsp'
          ImageIndex = 7
          OnClick = tbImprimirCPClick
        end
      end
      object grdCPostales: TRxDBGrid
        Left = 0
        Top = 24
        Width = 764
        Height = 354
        Align = alClient
        DataSource = dsPrestCP
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = tbModificarCPClick
        IniStorage = FormPlacement
        RowColor2 = 16776176
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cp_codigo'
            Title.Alignment = taCenter
            Title.Caption = 'C.Postal'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cp_localidad'
            Title.Caption = 'Localidad'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pv_descripcion'
            Title.Caption = 'Provincia'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tb_descripcion'
            Title.Caption = 'Regi'#243'n Sanitaria'
            Width = 150
            Visible = True
          end>
      end
      object fpAsignacionLocalidades: TFormPanel
        Left = 29
        Top = 43
        Width = 686
        Height = 364
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        BorderStyle = bsDialog
        Position = poOwnerFormCenter
        OnClose = fpAsignacionLocalidadesClose
        Constraints.MinHeight = 215
        Constraints.MinWidth = 576
        DesignSize = (
          686
          364)
        object Bevel10: TBevel
          Left = 4
          Top = 328
          Width = 678
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object spbAsignar: TSpeedButton
          Left = 330
          Top = 156
          Width = 23
          Height = 22
          Hint = 'Asignar las localidades'#13#10'seleccionadas'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E44140D
            55120D59110E4C13FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0F42140D620F0D6C0E0C6E0E0B710D0A790C0A7A0C0D5712FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF114E13126F1015721117721214
            6F10106C0D1168100D690E097D0B0C6310FF00FFFF00FFFF00FFFF00FFFF00FF
            134615187A111D7F141F8415208713287A21266A231070091571110F650F0A78
            0B0D5312FF00FFFF00FFFF00FFFF00FF1A7314218915269215259812239C0E43
            9338C8D6C84B81480F6D071674110F670F0B6D0DFF00FFFF00FFFF00FF144317
            228C152997162C851E3B8532308423518B4AF5FDF5E9F6E86592631069091471
            100D6A0E0F4414FF00FFFF00FF1957172A9C17269D0F649460F2F1F4EDECEEEF
            F2EFF4FDF3F0FEEFECFEEB7BA37A156910106E0E0E4913FF00FFFF00FF1C5B18
            31A8192CA9106F9D6AFFFFFFFFFFFFFFFFFFF9FEF8F2FDF2FAFFF9A1BEA11A6B
            1414760F0F4713FF00FFFF00FF184A1833AB1A3BBB1A40952F6DA16469A45E88
            AE83FFFFFFFFFFFF95B1952176161F8812177812113E15FF00FFFF00FFFF00FF
            2F991A3FC01F45CE1E46D91848E81358B540EEE7F2799E762288102A9F15238C
            15176F13FF00FFFF00FFFF00FFFF00FF1E5A193DBF1D45CB204EDB2353EB224D
            B0344A85432CA51036B11A2B9B18228C15144B16FF00FFFF00FFFF00FFFF00FF
            FF00FF26741A41C71E47D0204AD32243C61E3ABC173BB91D32A81A299917195E
            16FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF205E1A37A81D40C31E41
            C61E3CBD1D34AC1A288E18195317FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF1C511922681A216519194C18FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbAsignarClick
        end
        object spbDesasignar: TSpeedButton
          Left = 330
          Top = 228
          Width = 23
          Height = 22
          Hint = 'Desasignar las localidades'#13#10'seleccionadas'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F3E150E
            4B130E4E130F4115FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0F40140D5F0F0C6C0D0C6F0D0B730D0A790B0A740D0E4B13FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF104D13126E0F14711116711213
            6F0E11690E1066100C6C0D097D0B0D5712FF00FFFF00FFFF00FFFF00FFFF00FF
            134616187A111C7E13208615177F0C226D1D266B23187810146D110E660F0A78
            0C0F4814FF00FFFF00FFFF00FFFF00FF1A73142189152794171A850A3D7B39C3
            D4C450894B148305177D0D14710F0E690F0B680EFF00FFFF00FFFF00FF144417
            238D152B9C171D870B618D5EEAEEEAFFFFFF77A275357D2E3B8036246F20136C
            100C6A0E0F3C15FF00FFFF00FF1958172B9F17258E137D9F7BFCFBFDFFFFFFF2
            FCF1EAFAE8DAF0D9DBF8D973A2710F6B08106C0F0F4114FF00FFFF00FF1C5D18
            31AB18268B14AAB8ABFFFFFFFDFFFEF6FDF5F6FFF6F0FFEFF2FFF183AF821170
            081472100F4014FF00FFFF00FF194F1833AC1A3CBD1B30951B9FB2A0FFFFFFFF
            FFFF97B79461995A71A26D42813D1B8010167411113816FF00FFFF00FFFF00FF
            319F1B40C11F47D61E35AA1682A37FF9F4FC5D9A532BB30929A110269512228B
            16176A13FF00FFFF00FFFF00FFFF00FF2165193FC31E47CD2151E5223BC1145D
            9256488A3F3CC11936AD1B2B9A18218A14134716FF00FFFF00FFFF00FFFF00FF
            FF00FF2A7F1A43CB1F48D1214CD9223EC41838B01A3BB81E32A81A299917195C
            16FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF236A1A3AB01D41C51E41
            C71E3DC01D34AD1A298F18195217FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF1D5619236B1A2166191A4D18FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbDesasignarClick
        end
        object Label9: TLabel
          Left = 9
          Top = 12
          Width = 43
          Height = 13
          Caption = 'Provincia'
        end
        object Label8: TLabel
          Left = 9
          Top = 60
          Width = 113
          Height = 13
          Caption = 'Localidades sin asignar:'
        end
        object Label10: TLabel
          Left = 357
          Top = 60
          Width = 106
          Height = 13
          Caption = 'Localidades a asignar:'
        end
        object Label35: TLabel
          Left = 429
          Top = 36
          Width = 44
          Height = 13
          Caption = 'C.Postal:'
        end
        object Label36: TLabel
          Left = 9
          Top = 36
          Width = 44
          Height = 13
          Caption = 'Localidad'
        end
        object spbSelTodos: TSpeedButton
          Left = 275
          Top = 54
          Width = 23
          Height = 22
          Hint = 'Seleccionar todas las '#13#10'localidades sin asignar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
            865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
            3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
            9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
            6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
            0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
            F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
            67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
            49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
            FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
            AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
            6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
            EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
            40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
            71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
            FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
            46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
            EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbSelTodosClick
        end
        object spbUnSelTodos: TSpeedButton
          Left = 302
          Top = 54
          Width = 23
          Height = 22
          Hint = 'Deseleccionar todas las '#13#10'localidades sin asignar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
            855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
            A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
            9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
            6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
            C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
            F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
            5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
            55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
            FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
            B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
            91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
            E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
            40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
            F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
            FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
            45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
            EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbSelTodosClick
        end
        object spbSelTodos2: TSpeedButton
          Left = 625
          Top = 54
          Width = 23
          Height = 22
          Hint = 'Seleccionar todas las '#13#10'localidades a asignar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
            865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
            3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
            9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
            6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
            0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
            F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
            67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
            49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
            FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
            AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
            6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
            EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
            40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
            71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
            FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
            46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
            EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbSelTodos2Click
        end
        object spbUnSelTodos2: TSpeedButton
          Left = 652
          Top = 54
          Width = 23
          Height = 22
          Hint = 'Deseleccionar todas las '#13#10'localidades a asignar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
            855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
            A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
            9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
            6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
            C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
            F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
            5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
            55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
            FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
            B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
            91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
            E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
            40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
            F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
            FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
            45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
            EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Margin = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = spbSelTodos2Click
        end
        object btnAsignarCP: TButton
          Left = 444
          Top = 334
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Registrar'
          TabOrder = 7
          OnClick = btnAsignarCPClick
        end
        object btnCancelarAsigCP: TButton
          Left = 606
          Top = 334
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Terminar'
          ModalResult = 2
          TabOrder = 8
        end
        inline fraProvinciasCP: TfraCodigoDescripcion
          Left = 57
          Top = 6
          Width = 352
          Height = 23
          TabOrder = 0
          ExplicitLeft = 57
          ExplicitTop = 6
          ExplicitWidth = 352
          DesignSize = (
            352
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 288
            ExplicitLeft = 63
            ExplicitWidth = 288
          end
          inherited edCodigo: TPatternEdit
            Width = 57
            ExplicitWidth = 57
          end
        end
        object clbLocalidadesSinAsignar: TARTCheckListBox
          Left = 9
          Top = 78
          Width = 316
          Height = 244
          Hint = 'Hacer doble click para'#13#10'Seleccionar/Deseleccionar todos'
          Columns = 1
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnDblClick = clbLocalidadesSinAsignarDblClick
          AutoAjustarColumnas = True
          Locked = False
        end
        object clbLocalidadesAsignadas: TARTCheckListBox
          Left = 357
          Top = 78
          Width = 319
          Height = 244
          Hint = 'Hacer doble click para'#13#10'Seleccionar/Deseleccionar todos'
          Columns = 1
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnDblClick = clbLocalidadesAsignadasDblClick
          AutoAjustarColumnas = True
          Locked = False
        end
        object btnCancelarCP: TButton
          Left = 525
          Top = 334
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar Sel.'
          TabOrder = 9
          OnClick = btnCancelarCPClick
        end
        object edCPFiltro: TEdit
          Left = 474
          Top = 31
          Width = 34
          Height = 21
          MaxLength = 4
          TabOrder = 3
        end
        inline fraLocalidades: TfraCodigoDescripcion
          Left = 57
          Top = 30
          Width = 351
          Height = 23
          TabOrder = 2
          ExplicitLeft = 57
          ExplicitTop = 30
          ExplicitWidth = 351
          DesignSize = (
            351
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 63
            Width = 288
            ExplicitLeft = 63
            ExplicitWidth = 288
          end
          inherited edCodigo: TPatternEdit
            Width = 57
            ExplicitWidth = 57
          end
        end
        object btnFiltrar: TButton
          Left = 600
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 4
          OnClick = btnFiltrarClick
        end
        object chkSoloGBA: TCheckBox
          Left = 412
          Top = 10
          Width = 185
          Height = 17
          Caption = 'S'#243'lo localidades del GBA'
          TabOrder = 1
          Visible = False
        end
      end
    end
    object tsPreocupacionales: TTabSheet
      Hint = 'Examenes m'#233'dicos'
      Caption = 'Examenes m'#233'dicos'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object JvNetscapeSplitter1: TJvNetscapeSplitter
        Left = 0
        Top = 223
        Width = 764
        Height = 10
        Cursor = crVSplit
        Align = alBottom
        Maximized = False
        Minimized = False
        ButtonCursor = crDefault
        ExplicitTop = 220
        ExplicitWidth = 797
      end
      object CoolBar5: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 34
        AutoSize = True
        Bands = <
          item
            Break = False
            Control = ToolBar6
            ImageIndex = -1
            MinHeight = 30
            Width = 758
          end>
        Images = frmPrincipal.ilByN
        object ToolBar6: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 30
          AutoSize = True
          ButtonHeight = 30
          ButtonWidth = 31
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbVigenciaPreoc: TToolButton
            Left = 0
            Top = 0
            Hint = 'Filtrar Vigencia'
            DropdownMenu = pmuExamenes
            ImageIndex = 16
            Style = tbsDropDown
          end
          object ToolButton18: TToolButton
            Left = 46
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object tbAgregarPreocup: TToolButton
            Left = 54
            Top = 0
            Hint = 'Agregar examen preocupacional'
            ImageIndex = 23
            OnClick = tbAgregarPreocupClick
          end
          object tbModificarPreocup: TToolButton
            Tag = 3
            Left = 85
            Top = 0
            Hint = 'Modificar examen preocupacional'
            ImageIndex = 24
            ParentShowHint = False
            ShowHint = True
            OnClick = tbModificarPreocupClick
          end
          object tbBajaPreocup: TToolButton
            Left = 116
            Top = 0
            Hint = 'Anular examen'
            ImageIndex = 25
            OnClick = tbBajaPreocupClick
          end
          object ToolButton25: TToolButton
            Left = 147
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarPreocup: TToolButton
            Left = 155
            Top = 0
            Hint = 'Ordenar'
            ImageIndex = 5
            OnClick = tbOrdenarPreocupClick
          end
          object tbExportarPreocup: TToolButton
            Left = 186
            Top = 0
            Hint = 'Exportar'
            ImageIndex = 1
            OnClick = tbExportarPreocupClick
          end
          object tbImprimirPreocup: TToolButton
            Left = 217
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 7
            OnClick = tbImprimirPreocupClick
          end
        end
      end
      object dgExamenesDetalle: TRxDBGrid
        Left = 0
        Top = 233
        Width = 764
        Height = 145
        Hint = 'Detalle de lotes que componen el examen preocupacional'
        Align = alBottom
        DataSource = dsDetalleExamen
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dgExamenesDetalleDblClick
        RowColor2 = 16776176
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'le_id'
            Title.Alignment = taCenter
            Title.Caption = 'Lote'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LE_CANTIDAD'
            Title.Alignment = taCenter
            Title.Caption = 'Personas'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'le_autorizado'
            Title.Alignment = taCenter
            Title.Caption = 'Aut.'
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'le_fechaaut'
            Title.Alignment = taCenter
            Title.Caption = 'F. Autoriz.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EM_CUIT'
            Title.Caption = 'C.U.I.T.'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Empresa'
            Width = 280
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ES_CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ES_NROESTABLECI'
            Title.Alignment = taCenter
            Title.Caption = 'N'#176' Est.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_NOMBRE'
            Title.Caption = 'Establecimiento'
            Width = 350
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 198
        Width = 764
        Height = 25
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Detalle de lotes  que componen el examen preocupacional'
        TabOrder = 2
        object ToolBar7: TToolBar
          Left = 2
          Top = 2
          Width = 760
          Height = 22
          AutoSize = True
          ButtonWidth = 25
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton20: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object tbAltaEmpresaPreocup: TToolButton
            Left = 8
            Top = 0
            Hint = 'Asignar empresa al examen seleccionado'
            Caption = 'tbAltaEmpresaPreocup'
            ImageIndex = 44
            OnClick = tbAltaEmpresaPreocupClick
          end
          object tbBajaEmpresaPreocup: TToolButton
            Left = 33
            Top = 0
            Hint = 'Quitar empresa del examen seleccionado'
            Caption = 'tbBajaEmpresaPreocup'
            ImageIndex = 45
            OnClick = tbBajaEmpresaPreocupClick
          end
          object ToolButton2: TToolButton
            Left = 58
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 46
            Style = tbsSeparator
          end
          object tbAutorizarPreocup: TToolButton
            Left = 66
            Top = 0
            Hint = 'Autorizar lote seleccionado'
            ImageIndex = 39
            OnClick = tbAutorizarPreocupClick
          end
          object ToolButton19: TToolButton
            Left = 91
            Top = 0
            Width = 8
            Caption = 'ToolButton19'
            ImageIndex = 40
            Style = tbsSeparator
          end
          object tbPersonasLote: TToolButton
            Left = 99
            Top = 0
            Hint = 'Personas del lote'
            Caption = 'tbPersonasLote'
            ImageIndex = 6
            OnClick = tbPersonasLoteClick
          end
        end
      end
      object dgExamenes: TRxDBGrid
        Left = 0
        Top = 34
        Width = 764
        Height = 164
        Align = alClient
        DataSource = dsExamenes
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dgExamenesDblClick
        RowColor2 = 16776176
        OnGetCellParams = dgExamenesGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'EP_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EP_VIGENCIADESDE'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Desde'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EP_VIGENCIAHASTA'
            Title.Alignment = taCenter
            Title.Caption = 'Vig. Hasta'
            Width = 70
            Visible = True
          end>
      end
      object fpExamenPreocup: TFormPanel
        Left = 230
        Top = 43
        Width = 500
        Height = 250
        Caption = 'Carga de examenes preocupacionales'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = []
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        KeyPreview = True
        Constraints.MinHeight = 250
        Constraints.MinWidth = 500
        DesignSize = (
          500
          250)
        object Bevel19: TBevel
          Left = 0
          Top = 213
          Width = 500
          Height = 37
          Align = alBottom
          Shape = bsTopLine
        end
        object Label71: TLabel
          Left = 6
          Top = 39
          Width = 71
          Height = 13
          Caption = 'Vigencia desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 184
          Top = 39
          Width = 69
          Height = 13
          Caption = 'Vigencia hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 5
          Top = 11
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object Label66: TLabel
          Left = 367
          Top = 39
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object btnAceptarPreocup: TButton
          Left = 342
          Top = 220
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = btnAceptarPreocupClick
        end
        object btnCancelarPreocup: TButton
          Left = 420
          Top = 220
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = btnCancelarPreocupClick
        end
        object dgValoresExamenes: TJvDBGrid
          Left = 0
          Top = 61
          Width = 500
          Height = 152
          Align = alBottom
          DataSource = dsValoresExamen
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          MultiSelect = True
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'es_codigo'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'es_descripcion'
              ReadOnly = True
              Title.Caption = 'Descripci'#243'n'
              Width = 365
              Visible = True
            end>
        end
        object dcVigDesdePreocup: TDateComboBox
          Left = 83
          Top = 35
          Width = 88
          Height = 21
          MaxDateCombo = dcVigHastaPreocup
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dcVigHastaPreocup: TDateComboBox
          Left = 260
          Top = 35
          Width = 88
          Height = 21
          MinDateCombo = dcVigDesdePreocup
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edDescPreocup: TEdit
          Left = 83
          Top = 7
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 0
        end
        object btnAgregarPreocup: TBitBtn
          Left = 8
          Top = 220
          Width = 75
          Height = 25
          Hint = 'Agregar estudio'
          Anchors = [akRight, akBottom]
          Caption = '&Agregar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
            0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
            0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
            0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
            0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
            0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
            0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 5
          OnClick = btnAgregarPreocupClick
        end
        object btnQuitarPreocup: TBitBtn
          Left = 88
          Top = 220
          Width = 75
          Height = 25
          Hint = 'Quitar estudio'
          Anchors = [akRight, akBottom]
          Caption = '&Quitar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
            0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 6
          OnClick = btnQuitarPreocupClick
        end
        object edValorExamen: TCurrencyEdit
          Left = 400
          Top = 35
          Width = 59
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 99999.990000000000000000
          TabOrder = 3
        end
      end
      object fpAgregarEstudio: TFormPanel
        Left = 271
        Top = 69
        Width = 425
        Height = 72
        Caption = 'Alta de estudio'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        OnBeforeShow = fpAgregarEstudioBeforeShow
        KeyPreview = True
        DesignSize = (
          425
          72)
        object Bevel20: TBevel
          Left = 0
          Top = 35
          Width = 425
          Height = 37
          Align = alBottom
          Shape = bsTopLine
        end
        object Label67: TLabel
          Left = 8
          Top = 13
          Width = 35
          Height = 13
          Caption = 'Estudio'
        end
        object btnAceptarEstudio: TButton
          Left = 267
          Top = 42
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnAceptarEstudioClick
        end
        object btnCancelarEstudio: TButton
          Left = 345
          Top = 42
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ModalResult = 2
          ParentFont = False
          TabOrder = 2
        end
        inline fraEstudioPreocup: TfraEstudio
          Left = 48
          Top = 8
          Width = 374
          Height = 23
          TabOrder = 0
          ExplicitLeft = 48
          ExplicitTop = 8
          ExplicitWidth = 374
          DesignSize = (
            374
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 297
            ExplicitWidth = 297
          end
        end
      end
      object fpAltaEmpresaPreocup: TFormPanel
        Left = 164
        Top = 55
        Width = 702
        Height = 174
        Caption = 'Asignaci'#243'n de empresa a examen'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu]
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        OnBeforeShow = fpAltaEmpresaPreocupBeforeShow
        KeyPreview = True
        DesignSize = (
          702
          174)
        object Bevel21: TBevel
          Left = 0
          Top = 137
          Width = 702
          Height = 37
          Align = alBottom
          Shape = bsTopLine
        end
        object Label68: TLabel
          Left = 8
          Top = 14
          Width = 102
          Height = 13
          Caption = 'Examen seleccionado'
        end
        object Label69: TLabel
          Left = 570
          Top = 14
          Width = 90
          Height = 13
          Caption = 'Cantidad personas'
        end
        object btnAceptarEmpresaPreocup: TButton
          Left = 544
          Top = 144
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnAceptarEmpresaPreocupClick
        end
        object btnCancelarEmpresaPreocup: TButton
          Left = 622
          Top = 144
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ModalResult = 2
          ParentFont = False
          TabOrder = 4
        end
        object GroupBox2: TGroupBox
          Left = 4
          Top = 37
          Width = 695
          Height = 97
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Empresa / Establecimiento '
          TabOrder = 1
          DesignSize = (
            695
            97)
          object Label76: TLabel
            Left = 5
            Top = 24
            Width = 24
            Height = 13
            Caption = 'CUIT'
          end
          inline fraEmpresaExamen: TfraEmpresa
            Left = 37
            Top = 20
            Width = 654
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ExplicitLeft = 37
            ExplicitTop = 20
            ExplicitWidth = 654
            ExplicitHeight = 21
            DesignSize = (
              654
              21)
            inherited lbContrato: TLabel
              Left = 550
              ExplicitLeft = 550
            end
            inherited mskCUIT: TMaskEdit
              Font.Name = 'MS Sans Serif'
              ParentFont = False
            end
            inherited edContrato: TIntEdit
              Left = 597
              Font.Name = 'MS Sans Serif'
              ParentFont = False
              ExplicitLeft = 597
            end
            inherited cmbRSocial: TArtComboBox
              Width = 415
              Font.Name = 'MS Sans Serif'
              ParentFont = False
              ExplicitWidth = 415
            end
          end
          inline fraEstabExamen: TfraEstablecimiento
            Left = 2
            Top = 45
            Width = 691
            Height = 48
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitLeft = 2
            ExplicitTop = 45
            ExplicitWidth = 691
            ExplicitHeight = 48
            DesignSize = (
              691
              48)
            inherited lbLocalidad: TLabel
              Left = 457
              ExplicitLeft = 457
            end
            inherited lbCPostal: TLabel
              Left = 620
              ExplicitLeft = 620
            end
            inherited lbProvincia: TLabel
              Left = 457
              ExplicitLeft = 457
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 370
              ExplicitWidth = 370
            end
            inherited edLocalidad: TEdit
              Left = 509
              Width = 107
              ExplicitLeft = 509
              ExplicitWidth = 107
            end
            inherited edCPostal: TEdit
              Left = 644
              ExplicitLeft = 644
            end
            inherited edDomicilio: TEdit
              Width = 400
              ExplicitWidth = 400
            end
            inherited edProvincia: TEdit
              Left = 509
              ExplicitLeft = 509
            end
            inherited sdqDatos: TSDQuery
              Top = 52
            end
            inherited dsDatos: TDataSource
              Top = 52
            end
          end
        end
        object edExamenSel: TEdit
          Left = 114
          Top = 10
          Width = 453
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
        end
        object edCantExa: TIntEdit
          Left = 664
          Top = 10
          Width = 33
          Height = 21
          TabOrder = 0
          MaxLength = 4
        end
        object btnPersonasLote: TBitBtn
          Left = 6
          Top = 144
          Width = 102
          Height = 25
          Caption = 'Personas...'
          Glyph.Data = {
            36050000424D360500000000000036000000280000001A000000100000000100
            18000000000000050000C40E0000C40E0000000000000000000000FF00000033
            0000330000990000800000FF0000CC0000CC00009900008004040400FF0000FF
            0000FF005F5F5F5F5F5F5F5F5F5555557777776666666666666666665F5F5F77
            777700FF0000FF00000000FF0000FF000000FF000099000080969696A4A0A086
            868666666604040400FF0000FF0000FF0000FF0000FF007777775F5F5F4D4D4D
            969696A4A0A086868666666677777700FF0000FF0000FF00000000FF0000FF00
            000080969696C0C0C0B2B2B2A4A0A086868604040400FF0000FF0000FF0000FF
            0000FF0000FF00555555969696C0C0C0B2B2B2A4A0A086868680808000FF0000
            FF0000FF0000FF00000000FF0000FF00040404CCCCCCC0C0C0B2B2B2A4A0A086
            868604040404040404040400FF0000FF0000FF0000FF00808080CCCCCCC0C0C0
            B2B2B2A4A0A086868680808080808080808000FF0000FF00000000FF00040404
            1C1C1C040404C0C0C0B2B2B2A4A0A004040404040404040404040404040400FF
            0000FF00808080808080868686C0C0C0B2B2B2A4A0A080808080808080808080
            808080808000FF00000000FF001C1C1C1C1C1C040404040404C0C0C0CCCCCCCC
            CCCCCCCCCCCCCCCCC0C0C004040400FF0000FF00868686808080868686868686
            C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCC0C0C080808000FF0000001C1C1C1C1C1C
            1C1C1C040404040404040404DDDDDDD7D7D7D7D7D7CCCCCCC0C0C004040400FF
            00808080808080808080868686868686868686DDDDDDD7D7D7D7D7D7CCCCCCC0
            C0C080808000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
            DDDDD7D7D7CCCCCCC0C0C0040404040404808080808080868686868686868686
            C0C0C0DDDDDDDDDDDDD7D7D7CCCCCCC0C0C086868680808000001C1C1C1C1C1C
            040404040404C0C0C0E3E3E3E3E3E3DDDDDDD7D7D7D7D7D7CCCCCCC0C0C000FF
            00808080808080868686868686C0C0C0DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
            CCCCC0C0C000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
            DDDDDDDDDDFF0000E3E3E304040400FF00808080868686868686868686868686
            C0C0C0DDDDDDDDDDDDDDDDDD5F5F5FDDDDDD86868600FF0000001C1C1C1C1C1C
            1C1C1C040404040404040404040404DDDDDDDDDDDD04040404040404040400FF
            00808080808080808080868686868686868686868686DDDDDDDDDDDD86868686
            868686868600FF0000001C1C1C1C1C1C1C1C1C040404040404040404040404C0
            C0C0DDDDDDDDDDDDCCCCCC04040400FF00808080808080808080868686868686
            868686868686C0C0C0DDDDDDDDDDDDCCCCCC86868600FF00000000FF001C1C1C
            1C1C1C1C1C1C040404040404040404040404C0C0C0DDDDDDCCCCCC04040400FF
            0000FF00808080808080808080868686868686868686868686C0C0C0DDDDDDCC
            CCCC86868600FF00000000FF001C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C04
            040404040404040404040404040400FF0000FF00868686808080808080808080
            86868680808086868686868686868686868686868600FF00000000FF0000FF00
            1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C0404040404040404040404041C1C1C00FF
            0000FF0000FF0080808080808080808080808080808086868686868686868686
            868680808000FF00000000FF0000FF0000FF001C1C1C1C1C1C1C1C1C1C1C1C1C
            1C1C1C1C1C1C1C1C1C1C1C00FF0000FF0000FF0000FF0000FF00868686808080
            80808080808086868680808080808080808000FF0000FF000000}
          NumGlyphs = 2
          TabOrder = 2
          OnClick = btnPersonasLoteClick
        end
      end
      object fpPersonasLote: TFormPanel
        Left = 1002
        Top = 59
        Width = 451
        Height = 302
        Caption = 'Personas del lote'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = []
        BorderStyle = bsSingle
        Position = poOwnerFormCenter
        OnBeforeShow = fpPersonasLoteBeforeShow
        KeyPreview = True
        Constraints.MinHeight = 250
        Constraints.MinWidth = 280
        DesignSize = (
          451
          302)
        object Bevel23: TBevel
          Left = 0
          Top = 265
          Width = 451
          Height = 37
          Align = alBottom
          Shape = bsTopLine
        end
        object Label77: TLabel
          Left = 6
          Top = 36
          Width = 85
          Height = 13
          Caption = 'Nombre y apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label79: TLabel
          Left = 73
          Top = 11
          Width = 18
          Height = 13
          Caption = 'DNI'
        end
        object Label91: TLabel
          Left = 58
          Top = 61
          Width = 33
          Height = 13
          Caption = 'Puesto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label92: TLabel
          Left = 72
          Top = 85
          Width = 18
          Height = 13
          Caption = 'Mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnCerrarPerLote: TButton
          Left = 371
          Top = 272
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cerrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ModalResult = 2
          ParentFont = False
          TabOrder = 6
        end
        object dgPersonasLote: TJvDBGrid
          Left = 0
          Top = 109
          Width = 451
          Height = 156
          Align = alBottom
          DataSource = dsPersonasLote
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'PL_DNI'
              ReadOnly = True
              Title.Caption = 'DNI'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_NOMBRE'
              ReadOnly = True
              Title.Caption = 'Nombre y apellido'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_PUESTO'
              Title.Caption = 'Puesto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PL_MAIL'
              Title.Caption = 'Mail'
              Visible = True
            end>
        end
        object edNombrePersona: TEdit
          Left = 97
          Top = 32
          Width = 349
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 1
        end
        object btnAgregarPerLote: TBitBtn
          Left = 38
          Top = 272
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Agregar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
            0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
            0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
            0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
            0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
            0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
            0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 4
          OnClick = btnAgregarPerLoteClick
        end
        object btnQuitarPerLote: TBitBtn
          Left = 118
          Top = 272
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Quitar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
            0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
            D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 5
          OnClick = btnQuitarPerLoteClick
        end
        object edDNIPersona: TEdit
          Left = 97
          Top = 8
          Width = 183
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
        end
        object edPuesto: TEdit
          Left = 97
          Top = 57
          Width = 349
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 2
        end
        object edMailPersLote: TEdit
          Left = 97
          Top = 82
          Width = 349
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 3
        end
      end
    end
    object tsSiniestros: TTabSheet
      Caption = 'Siniestros'
      ImageIndex = 10
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CoolBar6: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = ToolBar8
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object ToolBar8: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarSiniestro: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarSiniestroClick
          end
          object tbModificarSiniestro: TToolButton
            Left = 24
            Top = 0
            Hint = 'Modificar'
            ImageIndex = 24
            OnClick = tbModificarSiniestroClick
          end
          object tbEliminarSiniestro: TToolButton
            Tag = 3
            Left = 48
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarSiniestroClick
          end
          object ToolButton24: TToolButton
            Left = 72
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarSiniestro: TToolButton
            Left = 80
            Top = 0
            Hint = 'Ordenar'
            Caption = 'tbOrdenarEsp'
            ImageIndex = 5
            OnClick = tbOrdenarS
          end
          object ToolButton27: TToolButton
            Left = 104
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarSiniestro: TToolButton
            Left = 112
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarSiniestroClick
          end
          object tbImprimirSiniestro: TToolButton
            Left = 136
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirSiniestroClick
          end
        end
      end
      object dbgSiniestros: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 350
        Align = alClient
        DataSource = dsSiniestros
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        RowColor2 = 16776176
        OnGetCellParams = dbgSiniestrosGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'SINIESTRO'
            Title.Caption = 'Siniestro'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V_DESDE'
            Title.Caption = 'Vigencia Desde'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V_HASTA'
            Title.Caption = 'Vigencia Hasta'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Title.Caption = 'Observaciones'
            Width = 300
            Visible = True
          end>
      end
      object fpDialogSiniestros: TFormPanel
        Left = 96
        Top = 96
        Width = 576
        Height = 215
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        Constraints.MinHeight = 215
        Constraints.MinWidth = 576
        DesignSize = (
          576
          215)
        object Bevel22: TBevel
          Left = 4
          Top = 179
          Width = 568
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label70: TLabel
          Left = 8
          Top = 42
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Vigencia Desde'
        end
        object Label73: TLabel
          Left = 8
          Top = 66
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Vigencia Hasta'
        end
        object Label74: TLabel
          Left = 8
          Top = 92
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Observaciones'
        end
        object Label75: TLabel
          Left = 37
          Top = 14
          Width = 43
          Height = 13
          AutoSize = False
          Caption = 'Siniestro'
        end
        object btnAceptarSiniestros: TButton
          Left = 418
          Top = 185
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnAceptarSiniestrosClick
        end
        object btnCancelarSiniestros: TButton
          Left = 496
          Top = 185
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object edVigenciaDesdeSin: TDateComboBox
          Left = 88
          Top = 38
          Width = 88
          Height = 21
          MaxDateCombo = edVigenciaHastaSin
          TabOrder = 1
        end
        object edVigenciaHastaSin: TDateComboBox
          Left = 88
          Top = 64
          Width = 88
          Height = 21
          MinDateCombo = edVigenciaDesdeSin
          TabOrder = 2
        end
        object edObservacionesSin: TMemo
          Left = 88
          Top = 90
          Width = 480
          Height = 84
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 250
          TabOrder = 3
        end
        object pnlSiniestro: TPanel
          Left = 85
          Top = 10
          Width = 139
          Height = 25
          BevelOuter = bvNone
          TabOrder = 0
          object sbtnBuscar: TSpeedButton
            Left = 116
            Top = 0
            Width = 21
            Height = 22
            Hint = 'Buscar Siniestro'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000C40E0000C40E00000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
              2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
              CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
              00000033330000336600003399000033CC000033FF0000660000006633000066
              6600006699000066CC000066FF00009900000099330000996600009999000099
              CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
              660000FF990000FFCC00330000003300330033006600330099003300CC003300
              FF00333300003333330033336600333399003333CC003333FF00336600003366
              330033666600336699003366CC003366FF003399000033993300339966003399
              99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
              FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
              6600660099006600CC006600FF00663300006633330066336600663399006633
              CC006633FF00666600006666330066666600666699006666CC00669900006699
              330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
              CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
              000099339900990099009900CC009900000099333300990066009933CC009900
              FF00996600009966330099336600996699009966CC009933FF00999933009999
              6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
              CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
              000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
              9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
              FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
              3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
              9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
              6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
              CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
              0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
              9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
              A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
              DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FAFAFAFAFAFA
              FAFAFAFAFAFAFA0A0A0AFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8FAFAFAFAFAFA
              FAFAFAFAFAFA0A4A740AFAFAFAFAFAFAFAFAFAFAFAFAF81C99F8FAFAFAFAFAFA
              FAFAFAFAFA0A4A991A0AFAFAFAFAFAFAFAFAFAFAFAF81C1A1BF8FAFAFAFAFAFA
              FAFAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFA
              FAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFAFA
              FAFA0A4A74990AFAFAFAFAFAFAFAFAFAFAFAF81C991AF8FAFAFAFAFAFA0A0A0A
              0A0A74521A0AFAFAFAFAFAFAFAF8F8F8F8F899991BF8FAFAFAFAFAFA0AB9E1B9
              B90A0A520AFAFAFAFAFAFAFAF8BB19BBBBF8F899F8FAFAFAFAFAFA0AB9E1E1B9
              B9B90A0AFAFAFAFAFAFAFAF8BB1919BBBBBBF8F8FAFAFAFAFAFA0AE2FF19E1BA
              B9B9B90AFAFAFAFAFAFAF8F3F4F31909BBBBBBF8FAFAFAFAFAFA0AE11919E1BA
              B9B9B90AFAFAFAFAFAFAF819F3F31909BBBBBBF8FAFAFAFAFAFA0AE1E1E1DBB9
              B9B3B30AFAFAFAFAFAFAF819191909BBBBBBBBF8FAFAFAFAFAFA0ADFDCDCDBB9
              B990B30AFAFAFAFAFAFAF8E1191909BBBBBBBBF8FAFAFAFAFAFAFA0ABABAB9B9
              B9900AFAFAFAFAFAFAFAFAF80909BBBBBBBBF8FAFAFAFAFAFAFAFAFA0AB9B9B3
              B30AFAFAFAFAFAFAFAFAFAFAF8BBBBBBBBF8FAFAFAFAFAFAFAFAFAFAFA0A0A0A
              0AFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F8FAFAFAFAFAFAFAFAFA}
            NumGlyphs = 2
            OnClick = sbtnBuscarClick
          end
          object SinEdit: TSinEdit
            Left = 2
            Top = 0
            Width = 112
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    object tsRemis: TTabSheet
      Caption = 'Rem'#237's'
      ImageIndex = 11
      object CoolBarRemis: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = ToolBarRemis
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object ToolBarRemis: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonHeight = 24
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarBaseRemis: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarBaseRemisClick
          end
          object tbEliminarBaseRemis: TToolButton
            Tag = 3
            Left = 24
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarBaseRemisClick
          end
          object ToolButton29: TToolButton
            Left = 48
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarBaseRemis: TToolButton
            Left = 56
            Top = 0
            Hint = 'Ordenar'
            ImageIndex = 5
            OnClick = tbOrdenarBaseRemisClick
          end
          object ToolButton31: TToolButton
            Left = 80
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarBaseRemis: TToolButton
            Left = 88
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarEsp'
            ImageIndex = 1
            OnClick = tbExportarBaseRemisClick
          end
          object tbImprimirBaseRemis: TToolButton
            Left = 112
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirEsp'
            ImageIndex = 7
            OnClick = tbImprimirBaseRemisClick
          end
        end
      end
      object dbgRemis: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 350
        Align = alClient
        DataSource = dsBaseRemis
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormPlacement
        RowColor2 = 16776176
        OnGetCellParams = dbgRemisGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'BR_CALLE'
            Width = 243
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BR_NUMERO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BR_LOCALIDAD'
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PV_DESCRIPCION'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BR_LAT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BR_LNG'
            Visible = True
          end>
      end
      object fpBaseRemis: TFormPanel
        Left = 20
        Top = 100
        Width = 600
        Height = 120
        Caption = 'Ingrese el domicilio de la remiser'#237'a'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderIcons = [biSystemMenu, biMaximize]
        Position = poOwnerFormCenter
        Constraints.MinHeight = 120
        Constraints.MinWidth = 600
        DesignSize = (
          600
          120)
        object Bevel29: TBevel
          Left = 4
          Top = 84
          Width = 592
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnAceptarRemis: TButton
          Left = 442
          Top = 90
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnAceptarRemisClick
        end
        object btnCancelarRemis: TButton
          Left = 520
          Top = 90
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        inline fraDomicilioGISRemis: TfraDomicilioGIS
          Left = 6
          Top = 8
          Width = 587
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 6
          ExplicitTop = 8
          ExplicitWidth = 587
          DesignSize = (
            587
            59)
          inherited lbNro: TLabel
            Left = 410
            ExplicitLeft = 410
          end
          inherited lbPiso: TLabel
            Left = 474
            ExplicitLeft = 474
          end
          inherited lbDto: TLabel
            Left = 526
            ExplicitLeft = 526
          end
          inherited lbProvincia: TLabel
            Left = 430
            ExplicitLeft = 430
          end
          inherited cmbCalle: TArtComboBox
            Width = 259
            ExplicitWidth = 259
          end
          inherited edNumero: TEdit
            Left = 426
            ExplicitLeft = 426
          end
          inherited edPiso: TEdit
            Left = 498
            ExplicitLeft = 498
          end
          inherited edDto: TEdit
            Left = 550
            ExplicitLeft = 550
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 155
            ExplicitWidth = 155
          end
          inherited edProvincia: TEdit
            Left = 478
            ExplicitLeft = 478
          end
          inherited btnBuscar: TButton
            Left = 126
            ExplicitLeft = 126
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 314
            ExplicitLeft = 314
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 360
            ExplicitLeft = 360
          end
        end
      end
    end
    object tsSucursales: TTabSheet
      Caption = 'Sucursales'
      ImageIndex = 12
      object CoolBar7: TCoolBar
        Left = 0
        Top = 0
        Width = 764
        Height = 28
        Bands = <
          item
            Break = False
            Control = ToolBar9
            ImageIndex = -1
            MinHeight = 24
            Width = 758
          end>
        object ToolBar9: TToolBar
          Left = 9
          Top = 0
          Width = 751
          Height = 24
          Align = alNone
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarSuc: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbAgregarSucClick
          end
          object tbModificarSuc: TToolButton
            Left = 24
            Top = 0
            Hint = 'Modificar'
            ImageIndex = 24
            OnClick = tbModificarSucClick
          end
          object tbEliminarSuc: TToolButton
            Tag = 3
            Left = 48
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarSucClick
          end
          object ToolButton33: TToolButton
            Left = 72
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarSuc: TToolButton
            Left = 80
            Top = 0
            Hint = 'Ordenar'
            Caption = 'tbOrdenarSuc'
            ImageIndex = 5
            OnClick = tbOrdenarSucClick
          end
          object ToolButton35: TToolButton
            Left = 104
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarSuc: TToolButton
            Left = 112
            Top = 0
            Hint = 'Exportar'
            Caption = 'tbExportarSuc'
            ImageIndex = 1
            OnClick = tbExportarSucClick
          end
          object tbImprimirSuc: TToolButton
            Left = 136
            Top = 0
            Hint = 'Imprimir'
            Caption = 'tbImprimirSuc'
            ImageIndex = 7
            OnClick = tbImprimirSucClick
          end
        end
      end
      object dgSucursales: TRxDBGrid
        Left = 0
        Top = 28
        Width = 764
        Height = 350
        Align = alClient
        DataSource = dsSucursales
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = tbModificarSucClick
        IniStorage = FormPlacement
        RowColor2 = 16776176
        Columns = <
          item
            Expanded = False
            FieldName = 'sp_nombre'
            Title.Caption = 'Sucursal'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'direccion'
            Title.Caption = 'Direcci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sp_telefono'
            Title.Caption = 'Tel'#233'fono'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sp_contacto'
            Title.Caption = 'Contacto'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sp_mail'
            Title.Caption = 'e-mail'
            Visible = True
          end>
      end
      object fpSucursales: TFormPanel
        Left = 100
        Top = 76
        Width = 641
        Height = 181
        Caption = 'Sucursales'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        Position = poOwnerFormCenter
        OnShow = fpSucursalesShow
        DesignSize = (
          641
          181)
        object Label93: TLabel
          Left = 14
          Top = 12
          Width = 61
          Height = 13
          Caption = 'Nombre Suc.'
        end
        object Label94: TLabel
          Left = 13
          Top = 115
          Width = 18
          Height = 13
          Caption = 'Tel.'
        end
        object Label95: TLabel
          Left = 179
          Top = 115
          Width = 44
          Height = 13
          Caption = 'Contacto'
        end
        object Label96: TLabel
          Left = 408
          Top = 115
          Width = 28
          Height = 13
          Caption = 'e-mail'
        end
        object Bevel32: TBevel
          Left = 7
          Top = 143
          Width = 623
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 30
          Width = 629
          Height = 75
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Direcci'#243'n'
          TabOrder = 1
          DesignSize = (
            629
            75)
          inline fraDireccionSuc: TfraDireccion
            Left = 8
            Top = 19
            Width = 613
            Height = 48
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = fraDireccionLegalExit
            ExplicitLeft = 8
            ExplicitTop = 19
            ExplicitWidth = 613
            ExplicitHeight = 48
            DesignSize = (
              613
              48)
            inherited lbCalle: TLabel
              Left = 3
              ExplicitLeft = 3
            end
            inherited lbNro: TLabel
              Left = 398
              ExplicitLeft = 398
            end
            inherited lbPiso: TLabel
              Left = 470
              ExplicitLeft = 470
            end
            inherited lbDto: TLabel
              Left = 547
              ExplicitLeft = 547
            end
            inherited lbCPostal: TLabel
              Left = 3
              Top = 29
              ExplicitLeft = 3
              ExplicitTop = 29
            end
            inherited lbCPA: TLabel
              Left = 113
              Top = 29
              ExplicitLeft = 113
              ExplicitTop = 29
            end
            inherited lbLocalidad: TLabel
              Left = 191
              Top = 29
              ExplicitLeft = 191
              ExplicitTop = 29
            end
            inherited lbProvincia: TLabel
              Left = 451
              Top = 29
              ExplicitLeft = 451
              ExplicitTop = 29
            end
            inherited cmbCalle: TArtComboBox
              Left = 56
              Width = 333
              ExplicitLeft = 56
              ExplicitWidth = 333
            end
            inherited edNumero: TEdit
              Left = 420
              ExplicitLeft = 420
            end
            inherited edPiso: TEdit
              Left = 496
              Width = 42
              ExplicitLeft = 496
              ExplicitWidth = 42
            end
            inherited edDto: TEdit
              Left = 569
              Width = 43
              ExplicitLeft = 569
              ExplicitWidth = 43
            end
            inherited edCPostal: TIntEdit
              Left = 56
              Top = 25
              Width = 54
              ExplicitLeft = 56
              ExplicitTop = 25
              ExplicitWidth = 54
            end
            inherited cmbLocalidad: TArtComboBox
              Left = 240
              Top = 25
              Width = 205
              ExplicitLeft = 240
              ExplicitTop = 25
              ExplicitWidth = 205
            end
            inherited edProvincia: TEdit
              Left = 500
              Top = 25
              Width = 112
              ExplicitLeft = 500
              ExplicitTop = 25
              ExplicitWidth = 112
            end
            inherited edCPA: TPatternEdit
              Left = 136
              Top = 25
              Width = 50
              ExplicitLeft = 136
              ExplicitTop = 25
              ExplicitWidth = 50
            end
          end
        end
        object edNombreSuc: TEdit
          Left = 80
          Top = 8
          Width = 554
          Height = 21
          TabOrder = 0
        end
        object edTelSuc: TEdit
          Left = 40
          Top = 112
          Width = 125
          Height = 21
          TabOrder = 2
        end
        object edContactoSuc: TEdit
          Left = 231
          Top = 112
          Width = 166
          Height = 21
          TabOrder = 3
        end
        object edMailSuc: TEdit
          Left = 442
          Top = 112
          Width = 184
          Height = 21
          TabOrder = 4
        end
        object btnAcepratSuc: TButton
          Left = 479
          Top = 151
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 5
          OnClick = btnAcepratSucClick
        end
        object btnCancelarSuc: TButton
          Left = 558
          Top = 151
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 6
        end
      end
    end
    object tsZonas: TTabSheet
      Caption = 'Zonas'
      ImageIndex = 13
      inline fraZonasPrestador: TfraZonasPrestador
        Left = 0
        Top = 0
        Width = 764
        Height = 378
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 764
        ExplicitHeight = 378
        inherited splVertical: TSplitter
          Height = 378
          ExplicitHeight = 406
        end
        inherited pnlZonas: TPanel
          Height = 378
          ExplicitHeight = 378
          inherited CoolBar1: TCoolBar
            Bands = <
              item
                Break = False
                Control = fraZonasPrestador.ToolBar1
                ImageIndex = -1
                MinHeight = 22
                Width = 327
              end>
            inherited ToolBar1: TToolBar
              Left = 9
              ExplicitLeft = 9
            end
          end
          inherited dbgZonas: TRxDBGrid
            Height = 327
          end
          inherited fpZonas: TFormPanel
            Top = 296
            ExplicitTop = 296
          end
        end
        inherited pnlDerechaZonas: TPanel
          Width = 424
          Height = 378
          ExplicitWidth = 424
          ExplicitHeight = 378
          inherited splHorizontal: TSplitter
            Width = 422
            ExplicitWidth = 455
          end
          inherited pnlTramos: TPanel
            Width = 422
            Height = 164
            ExplicitWidth = 422
            ExplicitHeight = 164
            inherited Panel5: TPanel
              Width = 420
              ExplicitWidth = 420
            end
            inherited CoolBar2: TCoolBar
              Width = 420
              Bands = <
                item
                  Break = False
                  Control = fraZonasPrestador.ToolBar2
                  ImageIndex = -1
                  MinHeight = 24
                  Width = 414
                end>
              ExplicitWidth = 420
              inherited ToolBar2: TToolBar
                Left = 9
                ExplicitLeft = 9
              end
            end
            inherited dbgTramos: TRxDBGrid
              Width = 420
              Height = 111
            end
          end
          inherited pnlDetalleZonas: TPanel
            Width = 422
            ExplicitWidth = 422
            DesignSize = (
              422
              207)
            inherited Panel4: TPanel
              Width = 420
              ExplicitWidth = 420
            end
            inherited CoolBar3: TCoolBar
              Width = 420
              Bands = <
                item
                  Break = False
                  Control = fraZonasPrestador.ToolBar3
                  ImageIndex = -1
                  MinHeight = 22
                  Width = 414
                end>
              ExplicitWidth = 420
              inherited ToolBar3: TToolBar
                Left = 9
                ExplicitLeft = 9
              end
            end
            inherited tvDetalleZona: TJvDBTreeView
              Width = 420
              ExplicitWidth = 420
            end
            inherited dbgZonaDetalle: TRxDBGrid
              Width = 245
            end
          end
        end
        inherited fpTramos: TFormPanel
          inherited fraNomenclador: TfraNomenclador
            PopupMenu = fraZonasPrestador.fraNomenclador.PopupMenu
            inherited ImageList: TImageList
              Bitmap = {
                494C010102007000740010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                0000000000003600000028000000400000001000000001002000000000000010
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000808080000000000080808000000
                0000000000000808080000000000080808000000000000000000080808000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000002942420000000000000000000000
                00000000000000000000000000000000000084848400CECECE00CECECE00CECE
                CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
                CE00080808000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000018180000FFFF0063A5A50031525200000000000000
                00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
                0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
                00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
                FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
                18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
                0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
                E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
                FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
                C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
                3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000BDA5
                A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
                EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
                FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
                CE00080808000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008C00
                0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
                F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
                CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
                0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
                B5000031310039393900000000000000000084848400FFFFFF00003100000031
                00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
                CE00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
                0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
                52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
                FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
                0000080808000000000008080800000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
                F700BDADAD008473000084000000942121002121210021212100000000000000
                00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
                9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
                9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
                2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
                0000000000000000000000000000000000008484840084848400848484008484
                8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
                CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000094393900F7F76B009C843900AD84
                7B00000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
                CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000943939007B7B0000AD6B6B000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
                FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
                9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000424D3E000000000000003E000000
                2800000040000000100000000100010000000000800000000000000000000000
                000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
                FC3F000700000000F81F000700000000F80F000700000000F007000700000000
                F003000700000000E001000700000000E001000700000000C003000700000000
                C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
                1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
                000000000000}
            end
          end
        end
      end
    end
  end
  object fpVerHistoricoBajas: TFormPanel
    Left = 814
    Top = 218
    Width = 609
    Height = 175
    Caption = 'Hist'#243'rico de Bajas de Prestadores'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpVerHistoricoBajasBeforeShow
    Constraints.MaxHeight = 285
    Constraints.MinHeight = 150
    Constraints.MinWidth = 270
    DesignSize = (
      609
      175)
    object lPrestador: TLabel
      Left = 3
      Top = 4
      Width = 606
      Height = 16
      AutoSize = False
      Caption = '  Prestador:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object btnHistBajaCerrar: TButton
      Left = 543
      Top = 151
      Width = 61
      Height = 20
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnHistBajaCerrarClick
    end
    object dbgHistBajas: TArtDBGrid
      Left = 3
      Top = 21
      Width = 602
      Height = 127
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = True
      DataSource = dsHistBajas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormPlacement
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PH_FECBAJA'
          Title.Caption = 'Fecha Baja'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUBAJA'
          Title.Caption = 'Usuario Baja'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PH_FECREACTIVACION'
          Title.Caption = 'Fecha Reactiv.'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUREACT'
          Title.Caption = 'Usuario Reactiv.'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mp_descripcion'
          Title.Caption = 'Motivo Baja'
          Width = 184
          Visible = True
        end>
    end
  end
  object fpMotivosBaja: TFormPanel
    Left = 741
    Top = -124
    Width = 685
    Height = 189
    Caption = 'Motivo Baja'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpMotivosBajaShow
    DesignSize = (
      685
      189)
    object Bevel25: TBevel
      Left = 4
      Top = 153
      Width = 677
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label86: TLabel
      Left = 13
      Top = 21
      Width = 71
      Height = 13
      Caption = 'Motivo de baja'
    end
    object Label87: TLabel
      Left = 504
      Top = 21
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Fecha de baja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAceptarMotBaja: TButton
      Left = 527
      Top = 159
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarMotBajaClick
    end
    object btnCancelarMotBaja: TButton
      Left = 605
      Top = 159
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivoBajaFP: TfraCodigoDescripcion
      Left = 92
      Top = 16
      Width = 357
      Height = 23
      TabOrder = 2
      ExplicitLeft = 92
      ExplicitTop = 16
    end
    object gbPrestRS: TGroupBox
      Left = 4
      Top = 43
      Width = 677
      Height = 73
      Caption = 'Prestador'
      TabOrder = 3
      inline fraPrestadorRS: TfraPrestador
        Left = 5
        Top = 15
        Width = 665
        Height = 55
        VertScrollBar.Range = 49
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 665
        ExplicitHeight = 55
        DesignSize = (
          665
          55)
        inherited lbCPostal: TLabel
          Left = 593
          ExplicitLeft = 593
        end
        inherited lbTelefono: TLabel
          Left = 505
          ExplicitLeft = 505
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 210
          ExplicitWidth = 210
        end
        inherited cmbPrestador: TArtComboBox
          Width = 336
          ExplicitWidth = 336
        end
        inherited edPresLocalidad: TEdit
          Width = 239
          ExplicitWidth = 239
        end
        inherited edPresCPostal: TEdit
          Left = 610
          ExplicitLeft = 610
        end
        inherited edPresTelefono: TEdit
          Left = 506
          ExplicitLeft = 506
        end
        inherited sdqPrestador: TSDQuery
          Left = 1
          Top = 50
        end
        inherited dsPrestador: TDataSource
          Left = 29
          Top = 50
        end
      end
    end
    object chkTransferir: TCheckBox
      Left = 12
      Top = 122
      Width = 257
      Height = 17
      Caption = 'Transferir autorizaciones pendientes de pago'
      TabOrder = 4
    end
    object dcFechaBaja: TDateComboBox
      Left = 584
      Top = 17
      Width = 88
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akTop, akRight]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'ModificarCargaValores'
      end
      item
        Name = 'DatosContables'
      end
      item
        Name = 'CargaPracticasPrestador'
      end
      item
        Name = 'TransferirAutorizaciones'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 461
    Top = 65532
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 445
    Top = 40
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ca_clave, ca_descripcion, ca_secuencia, ca_identificador,' +
        ' ca_telefono, ca_prestadormutual,'
      
        '       ca_banco, ca_tipocuenta, ca_cuenta, ca_bonificacion, ca_a' +
        'sistencial, ca_fechabaja,'
      
        '       ca_retencajamed, ca_retganancias, ca_retieneingbrutos, ca' +
        '_ingresosbrutos, ca_retingresosbrutos,'
      
        '       ca_tipo, ca_concertado, ca_direlectronica, ca_iva, ca_tip' +
        'ocomprobante, ca_diasvenci,'
      
        '       ca_nombrefanta, ca_fax, ca_responsable, ca_especialidad,c' +
        'a_observaciones, ca_habilitaciones,'
      '       ca_cronico, ca_rmn, ca_tac, ca_emg, ca_ambulancia,'
      
        '       ca_piso, ca_cti, ca_uco, ca_auti, ca_quirofanos, ca_guard' +
        'ias,ca_rayos, ca_conex,'
      '       ca_recladebitos, ca_limite, ca_contrato, ca_domicilio,'
      
        '       ca_calle, ca_numero, ca_pisocalle, ca_departamento, prest' +
        '.pv_descripcion provprest ,'
      '       ca_localidad, ca_codpostal, ca_provincia,'
      
        '       ca_callelegal, ca_numerolegal, ca_pisolegal, ca_departame' +
        'ntolegal,'
      
        '       ca_localidadlegal, ca_provincialegal, ca_codpostallegal, ' +
        'legal.pv_descripcion provlegal,'
      
        '       ca_matricula, ca_contratomutual, ca_auditable, ca_visible' +
        ', ca_fechaimpresionforminscr, '
      
        '       ca_cartillaweb, ca_ranking, ca_matprofesional, ca_tipomat' +
        'profesional, '
      
        '       ca_cargavalores, ca_fecharevision, ca_vtoexcganancias, ca' +
        '_vtoexcingbrutos,'
      
        '       ca_observacionesimp, ca_incluyenomenclador, ca_rx, ca_fkt' +
        ', ca_facturaconanestesia,'
      '       ca_guardiaact, ca_desdeguardiaact, ca_hastaguardiaact, '
      
        '       ca_guardiapas, ca_desdeguardiapas, ca_hastaguardiapas, ca' +
        '_ivadiscriminado, ca_habilitado,'
      '       ca_codpostala, ca_lat, ca_lng, ca_actividad,'
      
        '       ca_fechavtohabilitacion, ca_respcivil, ca_fecharespcivil,' +
        ' ca_ecografia, ca_gestor, ca_esreferente,'
      
        '       ca_maildebitos, ca_codarea, ca_celular, ca_cem, ca_idmoti' +
        'vobaja, CA_CODPOSTALCOMERCIAL, '
      
        '       ca_localidadcomercial, ca_callecomercial, ca_numerocomerc' +
        'ial, ca_pisocomercial, '
      
        '       ca_departamentocomercial, ca_provinciacomercial, ca_maila' +
        'dministracion, ca_consultorio, '
      
        '       ca_delegacion, ca_visadodocum, ca_fdotierradelfuego, gp_c' +
        'odigo'
      
        '  FROM cpr_prestador, cpv_provincias prest , cpv_provincias lega' +
        'l, SIN.sgp_gruposprestador'
      ' WHERE ca_provincia = prest.pv_codigo(+)'
      '   AND ca_provincialegal = legal.pv_codigo(+)'
      '   AND ca_idgrupousuario = gp_id(+)'
      '   AND ca_identificador = :pidentif')
    Left = 474
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdentif'
        ParamType = ptInput
      end>
    object sdqDatosCA_CLAVE: TStringField
      FieldName = 'CA_CLAVE'
      Required = True
      Size = 11
    end
    object sdqDatosCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqDatosCA_DOMICILIO: TStringField
      FieldName = 'CA_DOMICILIO'
      Size = 200
    end
    object sdqDatosCA_LOCALIDAD: TStringField
      DisplayWidth = 85
      FieldName = 'CA_LOCALIDAD'
      Size = 85
    end
    object sdqDatosCA_CODPOSTAL: TStringField
      FieldName = 'CA_CODPOSTAL'
      Size = 5
    end
    object sdqDatosCA_PROVINCIA: TStringField
      FieldName = 'CA_PROVINCIA'
      Size = 2
    end
    object sdqDatosCA_SECUENCIA: TFloatField
      FieldName = 'CA_SECUENCIA'
      Required = True
    end
    object sdqDatosCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqDatosCA_TELEFONO: TStringField
      FieldName = 'CA_TELEFONO'
      Size = 50
    end
    object sdqDatosCA_PRESTADORMUTUAL: TStringField
      FieldName = 'CA_PRESTADORMUTUAL'
      Required = True
      Size = 12
    end
    object sdqDatosCA_BANCO: TStringField
      FieldName = 'CA_BANCO'
      Size = 3
    end
    object sdqDatosCA_TIPOCUENTA: TStringField
      FieldName = 'CA_TIPOCUENTA'
      Size = 2
    end
    object sdqDatosCA_CUENTA: TStringField
      FieldName = 'CA_CUENTA'
      Size = 17
    end
    object sdqDatosCA_BONIFICACION: TFloatField
      FieldName = 'CA_BONIFICACION'
    end
    object sdqDatosCA_ASISTENCIAL: TFloatField
      FieldName = 'CA_ASISTENCIAL'
    end
    object sdqDatosCA_FECHABAJA: TDateTimeField
      FieldName = 'CA_FECHABAJA'
    end
    object sdqDatosCA_RETENCAJAMED: TStringField
      FieldName = 'CA_RETENCAJAMED'
      Required = True
      Size = 1
    end
    object sdqDatosCA_RETGANANCIAS: TStringField
      FieldName = 'CA_RETGANANCIAS'
      Size = 6
    end
    object sdqDatosCA_RETIENEINGBRUTOS: TStringField
      FieldName = 'CA_RETIENEINGBRUTOS'
      Size = 1
    end
    object sdqDatosCA_INGRESOSBRUTOS: TFloatField
      FieldName = 'CA_INGRESOSBRUTOS'
    end
    object sdqDatosCA_RETINGRESOSBRUTOS: TStringField
      FieldName = 'CA_RETINGRESOSBRUTOS'
      Size = 10
    end
    object sdqDatosCA_TIPO: TStringField
      FieldName = 'CA_TIPO'
      Size = 3
    end
    object sdqDatosCA_CONCERTADO: TStringField
      FieldName = 'CA_CONCERTADO'
      Size = 1
    end
    object sdqDatosCA_DIRELECTRONICA: TStringField
      FieldName = 'CA_DIRELECTRONICA'
      Size = 300
    end
    object sdqDatosCA_IVA: TStringField
      FieldName = 'CA_IVA'
      Size = 1
    end
    object sdqDatosCA_TIPOCOMPROBANTE: TStringField
      FieldName = 'CA_TIPOCOMPROBANTE'
      Size = 3
    end
    object sdqDatosCA_DIASVENCI: TFloatField
      FieldName = 'CA_DIASVENCI'
    end
    object sdqDatosCA_NOMBREFANTA: TStringField
      FieldName = 'CA_NOMBREFANTA'
      Size = 150
    end
    object sdqDatosCA_FAX: TStringField
      FieldName = 'CA_FAX'
      Size = 50
    end
    object sdqDatosCA_RESPONSABLE: TStringField
      FieldName = 'CA_RESPONSABLE'
      Size = 50
    end
    object sdqDatosCA_ESPECIALIDAD: TStringField
      FieldName = 'CA_ESPECIALIDAD'
    end
    object sdqDatosCA_OBSERVACIONES: TStringField
      FieldName = 'CA_OBSERVACIONES'
      Size = 2000
    end
    object sdqDatosCA_HABILITACIONES: TStringField
      FieldName = 'CA_HABILITACIONES'
      Size = 1999
    end
    object sdqDatosCA_CRONICO: TStringField
      FieldName = 'CA_CRONICO'
      Size = 1
    end
    object sdqDatosCA_RMN: TStringField
      FieldName = 'CA_RMN'
      Size = 1
    end
    object sdqDatosCA_TAC: TStringField
      FieldName = 'CA_TAC'
      Size = 1
    end
    object sdqDatosCA_EMG: TStringField
      FieldName = 'CA_EMG'
      Size = 1
    end
    object sdqDatosCA_AMBULANCIA: TStringField
      FieldName = 'CA_AMBULANCIA'
      Size = 1
    end
    object sdqDatosCA_PISO: TFloatField
      FieldName = 'CA_PISO'
    end
    object sdqDatosCA_CTI: TFloatField
      FieldName = 'CA_CTI'
    end
    object sdqDatosCA_UCO: TFloatField
      FieldName = 'CA_UCO'
    end
    object sdqDatosCA_AUTI: TFloatField
      FieldName = 'CA_AUTI'
    end
    object sdqDatosCA_QUIROFANOS: TFloatField
      FieldName = 'CA_QUIROFANOS'
    end
    object sdqDatosCA_GUARDIAS: TFloatField
      FieldName = 'CA_GUARDIAS'
    end
    object sdqDatosCA_RAYOS: TFloatField
      FieldName = 'CA_RAYOS'
    end
    object sdqDatosCA_CONEX: TFloatField
      FieldName = 'CA_CONEX'
    end
    object sdqDatosCA_RECLADEBITOS: TFloatField
      FieldName = 'CA_RECLADEBITOS'
    end
    object sdqDatosCA_CONTRATO: TStringField
      FieldName = 'CA_CONTRATO'
      Size = 1
    end
    object sdqDatosCA_CALLE: TStringField
      FieldName = 'CA_CALLE'
      Size = 60
    end
    object sdqDatosCA_NUMERO: TStringField
      FieldName = 'CA_NUMERO'
    end
    object sdqDatosCA_PISOCALLE: TStringField
      FieldName = 'CA_PISOCALLE'
    end
    object sdqDatosCA_DEPARTAMENTO: TStringField
      FieldName = 'CA_DEPARTAMENTO'
    end
    object sdqDatosCA_MATRICULA: TStringField
      FieldName = 'CA_MATRICULA'
      Size = 8
    end
    object sdqDatosCA_CALLELEGAL: TStringField
      FieldName = 'CA_CALLELEGAL'
      Size = 60
    end
    object sdqDatosCA_NUMEROLEGAL: TStringField
      FieldName = 'CA_NUMEROLEGAL'
    end
    object sdqDatosCA_PISOLEGAL: TStringField
      FieldName = 'CA_PISOLEGAL'
    end
    object sdqDatosCA_DEPARTAMENTOLEGAL: TStringField
      FieldName = 'CA_DEPARTAMENTOLEGAL'
    end
    object sdqDatosCA_LOCALIDADLEGAL: TStringField
      FieldName = 'CA_LOCALIDADLEGAL'
      Size = 85
    end
    object sdqDatosCA_PROVINCIALEGAL: TStringField
      FieldName = 'CA_PROVINCIALEGAL'
      Size = 2
    end
    object sdqDatosCA_CODPOSTALLEGAL: TStringField
      FieldName = 'CA_CODPOSTALLEGAL'
      Size = 5
    end
    object sdqDatosPROVLEGAL: TStringField
      FieldName = 'PROVLEGAL'
      Size = 50
    end
    object sdqDatosPROVPREST: TStringField
      FieldName = 'PROVPREST'
      Size = 50
    end
    object sdqDatosCA_CONTRATOMUTUAL: TStringField
      FieldName = 'CA_CONTRATOMUTUAL'
    end
    object sdqDatosCA_AUDITABLE: TStringField
      FieldName = 'CA_AUDITABLE'
      Size = 1
    end
    object sdqDatosCA_VISIBLE: TStringField
      FieldName = 'CA_VISIBLE'
      Size = 1
    end
    object sdqDatosCA_LIMITE: TFloatField
      FieldName = 'CA_LIMITE'
    end
    object sdqDatosCA_FECHAIMPRESIONFORMINSCR: TDateTimeField
      FieldName = 'CA_FECHAIMPRESIONFORMINSCR'
    end
    object sdqDatosCA_CARTILLAWEB: TStringField
      FieldName = 'CA_CARTILLAWEB'
      Size = 1
    end
    object sdqDatosCA_RANKING: TStringField
      FieldName = 'CA_RANKING'
      Size = 1
    end
    object sdqDatosCA_MATPROFESIONAL: TStringField
      FieldName = 'CA_MATPROFESIONAL'
      Size = 8
    end
    object sdqDatosCA_TIPOMATPROFESIONAL: TStringField
      FieldName = 'CA_TIPOMATPROFESIONAL'
      Size = 1
    end
    object sdqDatosCA_CARGAVALORES: TStringField
      FieldName = 'CA_CARGAVALORES'
      Size = 1
    end
    object sdqDatosCA_FECHAREVISION: TDateTimeField
      FieldName = 'CA_FECHAREVISION'
    end
    object sdqDatosCA_VTOEXCGANANCIAS: TDateTimeField
      FieldName = 'CA_VTOEXCGANANCIAS'
    end
    object sdqDatosCA_VTOEXCINGBRUTOS: TDateTimeField
      FieldName = 'CA_VTOEXCINGBRUTOS'
    end
    object sdqDatosCA_OBSERVACIONESIMP: TStringField
      FieldName = 'CA_OBSERVACIONESIMP'
      Size = 2000
    end
    object sdqDatosCA_INCLUYENOMENCLADOR: TStringField
      FieldName = 'CA_INCLUYENOMENCLADOR'
      Size = 1
    end
    object sdqDatosCA_RX: TStringField
      FieldName = 'CA_RX'
      Size = 1
    end
    object sdqDatosCA_FKT: TStringField
      FieldName = 'CA_FKT'
      Size = 1
    end
    object sdqDatosCA_GUARDIAACT: TStringField
      FieldName = 'CA_GUARDIAACT'
      Size = 1
    end
    object sdqDatosCA_DESDEGUARDIAACT: TStringField
      FieldName = 'CA_DESDEGUARDIAACT'
      Size = 5
    end
    object sdqDatosCA_HASTAGUARDIAACT: TStringField
      FieldName = 'CA_HASTAGUARDIAACT'
      Size = 5
    end
    object sdqDatosCA_GUARDIAPAS: TStringField
      FieldName = 'CA_GUARDIAPAS'
      Size = 1
    end
    object sdqDatosCA_DESDEGUARDIAPAS: TStringField
      FieldName = 'CA_DESDEGUARDIAPAS'
      Size = 5
    end
    object sdqDatosCA_HASTAGUARDIAPAS: TStringField
      FieldName = 'CA_HASTAGUARDIAPAS'
      Size = 5
    end
    object sdqDatosCA_IVADISCRIMINADO: TStringField
      FieldName = 'CA_IVADISCRIMINADO'
      Size = 1
    end
    object sdqDatosCA_HABILITADO: TStringField
      FieldName = 'CA_HABILITADO'
      Size = 1
    end
    object sdqDatosCA_LAT: TFloatField
      FieldName = 'CA_LAT'
    end
    object sdqDatosCA_LNG: TFloatField
      FieldName = 'CA_LNG'
    end
    object sdqDatosCA_CODPOSTALA: TStringField
      FieldName = 'CA_CODPOSTALA'
      Size = 8
    end
    object sdqDatosCA_ACTIVIDAD: TFloatField
      FieldName = 'CA_ACTIVIDAD'
    end
    object sdqDatosCA_FECHAVTOHABILITACION: TDateTimeField
      FieldName = 'CA_FECHAVTOHABILITACION'
    end
    object sdqDatosCA_RESPCIVIL: TStringField
      FieldName = 'CA_RESPCIVIL'
      Size = 1
    end
    object sdqDatosCA_FECHARESPCIVIL: TDateTimeField
      FieldName = 'CA_FECHARESPCIVIL'
    end
    object sdqDatosCA_FACTURACONANESTESIA: TStringField
      FieldName = 'CA_FACTURACONANESTESIA'
      Size = 1
    end
    object sdqDatosCA_ECOGRAFIA: TStringField
      FieldName = 'CA_ECOGRAFIA'
      Size = 1
    end
    object sdqDatosca_gestor: TStringField
      FieldName = 'ca_gestor'
    end
    object sdqDatosca_referente: TStringField
      FieldName = 'ca_esreferente'
      Size = 1
    end
    object sdqDatosca_maildebitos: TStringField
      FieldName = 'ca_maildebitos'
      Size = 300
    end
    object sdqDatosCA_CELULAR: TStringField
      DisplayWidth = 50
      FieldName = 'CA_CELULAR'
      Size = 50
    end
    object sdqDatosCA_CODAREA: TStringField
      FieldName = 'CA_CODAREA'
    end
    object sdqDatosCA_CEM: TStringField
      FieldName = 'CA_CEM'
    end
    object sdqDatosCA_IDMOTIVOBAJA: TFloatField
      FieldName = 'CA_IDMOTIVOBAJA'
    end
    object sdqDatosCA_CODPOSTALCOMERCIAL: TStringField
      FieldName = 'CA_CODPOSTALCOMERCIAL'
    end
    object sdqDatosCA_LOCALIDADCOMERCIAL: TStringField
      FieldName = 'CA_LOCALIDADCOMERCIAL'
    end
    object sdqDatosCA_CALLECOMERCIAL: TStringField
      FieldName = 'CA_CALLECOMERCIAL'
    end
    object sdqDatosCA_NUMEROCOMERCIAL: TStringField
      FieldName = 'CA_NUMEROCOMERCIAL'
    end
    object sdqDatosCA_PISOCOMERCIAL: TStringField
      FieldName = 'CA_PISOCOMERCIAL'
    end
    object sdqDatosCA_DEPARTAMENTOCOMERCIAL: TStringField
      FieldName = 'CA_DEPARTAMENTOCOMERCIAL'
    end
    object sdqDatosCA_PROVINCIACOMERCIAL: TStringField
      FieldName = 'CA_PROVINCIACOMERCIAL'
    end
    object sdqDatosca_mailadministracion: TStringField
      FieldName = 'ca_mailadministracion'
      Size = 1000
    end
    object sdqDatosCA_CONSULTORIO: TStringField
      FieldName = 'CA_CONSULTORIO'
      Size = 1
    end
    object sdqDatosCA_DELEGACION: TStringField
      FieldName = 'CA_DELEGACION'
      Size = 4
    end
    object sdqDatosCA_VISADODOCUM: TStringField
      FieldName = 'CA_VISADODOCUM'
    end
    object sdqDatosCA_FDOTIERRADELFUEGO: TStringField
      FieldName = 'CA_FDOTIERRADELFUEGO'
      Size = 1
    end
    object sdqDatosGP_CODIGO: TStringField
      FieldName = 'GP_CODIGO'
      Size = 10
    end
  end
  object dsRetDeGanacias: TDataSource
    DataSet = sdqRetDeGanacias
    Left = 561
    Top = 484
  end
  object sdqRetDeGanacias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT tb_codigo, tb_descripcion'
      '   FROM ctb_tablas'
      'WHERE tb_clave = '#39'RETGA'#39
      '     AND tb_codigo <> '#39'0'#39
      'ORDER BY tb_descripcion'
      '')
    Left = 533
    Top = 484
    object sdqRetDeGanaciasTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqRetDeGanaciasTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
  end
  object dsIngBrutConceptos: TDataSource
    DataSet = sdqIngBrutConceptos
    Left = 893
    Top = 500
  end
  object sdqIngBrutConceptos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT IB_CODIGO, IB_RETENCION, IB_TIPOINGBRUTOS'
      'FROM CIB_INGRESOSBRUTOS'
      'WHERE IB_PROVINCIA = :pProvincia'
      '     AND IB_FECHABAJA IS NULL'
      'ORDER BY IB_RETENCION')
    Left = 865
    Top = 500
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pProvincia'
        ParamType = ptInput
      end>
  end
  object dsCaracter: TDataSource
    DataSet = sdqCaracter
    Left = 897
    Top = 472
  end
  object sdqCaracter: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TATEN'#39
      'AND TB_CODIGO <> '#39'0'#39
      'AND TB_FECHABAJA IS NULL'
      'ORDER BY TB_DESCRIPCION')
    Left = 869
    Top = 472
  end
  object sdqIVA: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'SIVA'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 129
    Top = 552
  end
  object dsIVA: TDataSource
    DataSet = sdqIVA
    Left = 157
    Top = 552
  end
  object dsTipoComprobante: TDataSource
    DataSet = sdqTipoComprobante
    Left = 837
    Top = 500
  end
  object sdqTipoComprobante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TCOMP'#39
      'AND TB_CODIGO <> '#39'0'#39)
    Left = 809
    Top = 500
  end
  object pmnuIngBrutos: TPopupMenu
    Left = 537
    Top = 452
    object mnuNroIngBrutos: TMenuItem
      Caption = 'Nro.Ing.Brutos'
      OnClick = mnuIngBrutosClick
    end
    object mnuCUIT: TMenuItem
      Tag = 1
      Caption = 'CUIT/CUIL     '
      OnClick = mnuIngBrutosClick
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        OnShortCutPress = tbAgregarClick
        LinkControl = tbAgregar
      end
      item
        Key = 16463
        OnShortCutPress = tbModificarClick
        LinkControl = tbModificar
      end
      item
        Key = 16453
        OnShortCutPress = tbEliminarClick
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        OnShortCutPress = tbConsultorioClick
        LinkControl = tbSalir2
      end
      item
        Key = 16469
        LinkControl = tbCuentasBancarias
      end
      item
        Key = 16449
        LinkControl = tbAuditable
      end
      item
        Key = 16452
        LinkControl = tbNoAuditable
      end
      item
        Key = 16464
        LinkControl = tbPracticasPrestador
      end>
    Left = 701
    Top = 52
  end
  object sdqTipoPrestador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'Select TP_CODIGO, TP_DESCRIPCION, TP_FBAJA, TP_DATOSMEDICOS'
      'From   MTP_TIPOPRESTADOR')
    Left = 129
    Top = 608
  end
  object dsTipoPrestador: TDataSource
    DataSet = sdqTipoPrestador
    Left = 157
    Top = 608
  end
  object sdqEspecialidades: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select pe_especialidad, es_descripcion, pe_observaciones, pe_fec' +
        'habaja,'
      '          pe_guardiaact, pe_desdeguardiaact, pe_hastaguardiaact,'
      '          pe_guardiapas, pe_desdeguardiapas, pe_hastaguardiapas'
      'from   cpe_prestaespeci, mes_especialidades'
      'where  pe_especialidad = es_codigo')
    Left = 432
    Top = 260
  end
  object dsEspecialidades: TDataSource
    DataSet = sdqEspecialidades
    Left = 460
    Top = 260
  end
  object sdqDescEspecialidad: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select es_codigo, es_descripcion'
      'from mes_especialidades'
      'where es_fechabaja is null')
    Left = 129
    Top = 580
  end
  object dsDescEspecialidad: TDataSource
    DataSet = sdqDescEspecialidad
    Left = 157
    Top = 580
  end
  object SortDialogEsp: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEspecialidades
    SortFields = <>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 544
    Top = 260
  end
  object ExportDialogEsp: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqEspecialidades
    Fields = <>
    OutputFile = 'Especialidades.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 516
    Top = 260
  end
  object QueryPrintEsp: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'PE_ESPECIALIDAD'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Especialidad'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 40
      end
      item
        Title = 'Observaciones'
        DataField = 'PE_OBSERVACIONES'
        MaxLength = 40
      end
      item
        Title = 'Fecha Baja'
        TitleAlignment = taCenter
        DataField = 'PE_FECHABAJA'
        Alignment = taCenter
        MaxLength = 6
      end>
    DataSource = dsEspecialidades
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Especialidades del Prestador'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 488
    Top = 260
  end
  object PrintDialog: TPrintDialog
    Left = 564
    Top = 13
  end
  object dsValNomenclador: TDataSource
    DataSet = sdqValNomenclador
    Left = 460
    Top = 288
  end
  object sdqValNomenclador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT vp_prestador, vp_nomenclador, vp_capitulo, vp_codigo, on_' +
        'descripcion,'
      
        '       vp_vigenciadesde, vigenciahasta, vp_multiplicador, vp_mul' +
        'tigastos, vp_anestesia,'
      
        '       vp_hiv, vp_antitetanica, vp_sesiones, vp_valor, on_id, ca' +
        'ntidad, siniestro,'
      
        '       vp_valorgastos, vp_valorhonorarios, vp_siniestro, vp_orde' +
        'n, vp_recaida,'
      
        '       vp_monto_minimo, vp_suma_fija, vp_km_incluidos, vp_abona_' +
        'retorno, vp_default, nvl(vp_valordeamp, '#39'N'#39') vp_valordeamp,'
      
        '       on_cabecera, vp_unicaliquidacion, vp_usualta, vp_fechaalt' +
        'a, vp_usumodif, vp_fechamodif,'
      
        '       vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_findesema' +
        'na'
      
        '  FROM (SELECT vp_prestador, vp_nomenclador, vp_capitulo, vp_cod' +
        'igo, on_descripcion,'
      
        '               vp_vigenciadesde, vp_vigenciahasta AS vigenciahas' +
        'ta, vp_multiplicador,'
      
        '               vp_multigastos, vp_anestesia, vp_hiv, vp_antiteta' +
        'nica, vp_sesiones,'
      
        '               vp_valor, on_id, NULL cantidad, NULL siniestro, v' +
        'p_valorgastos,'
      
        '               vp_valorhonorarios, NULL vp_siniestro, NULL vp_or' +
        'den, NULL vp_recaida,'
      
        '               vp_monto_minimo, vp_suma_fija, vp_km_incluidos, v' +
        'p_abona_retorno, vp_default, nvl(vp_valordeamp, '#39'N'#39') vp_valordea' +
        'mp,'
      
        '               on_cabecera, vp_unicaliquidacion, vp_fechabaja, v' +
        'p_usualta, vp_fechaalta, vp_usumodif, vp_fechamodif,'
      
        '               vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_f' +
        'indesemana'
      '          FROM art.svp_valorprestador, art.son_nomenclador'
      '         WHERE vp_nomenclador = on_nomenclador'
      '           AND vp_capitulo = on_capitulo'
      '           AND vp_codigo = on_codigo'
      '           AND vp_prestador = :pprestador'
      '        UNION ALL'
      
        '        SELECT pp_prestador, on_nomenclador, on_capitulo, on_cod' +
        'igo, on_descripcion,'
      
        '               pp_vigenciadesde, pp_vigenciahasta AS vigenciahas' +
        'ta, NULL, NULL, NULL,'
      '               NULL, NULL, NULL, pp_valor, on_id, pp_cantidad,'
      
        '               art.siniestro.get_siniestrocompleto(pp_idexpedien' +
        'te), NULL, NULL,'
      '               ex_siniestro, ex_orden, ex_recaida,'
      
        '               NULL vp_monto_minimo, NULL vp_suma_fija, NULL vp_' +
        'km_incluidos, NULL vp_abona_retorno, NULL vp_default,'
      
        '               NULL vp_valordeamp, on_cabecera, NULL vp_unicaliq' +
        'uidacion, null vp_fechabaja,'
      
        '               null vp_usualta, null vp_fechaalta, null vp_usumo' +
        'dif, null vp_fechamodif,'
      
        '               null vp_viaje_exclusivo, null vp_viaje_nocturno, ' +
        'null vp_viaje_findesemana'
      
        '          FROM art.spp_prestador_presupuesto, art.son_nomenclado' +
        'r, art.sex_expedientes'
      '         WHERE pp_idnomenclador = on_id'
      '           AND pp_idexpediente = ex_id(+)'
      '           AND pp_fechabaja IS NULL'
      '           AND pp_prestador = :pprestador)'
      ' WHERE 1 = 1 and vp_fechabaja is null')
    Left = 432
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPrestador'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pprestador'
        ParamType = ptInput
      end>
    object sdqValNomencladorVP_PRESTADOR: TFloatField
      FieldName = 'VP_PRESTADOR'
      Required = True
    end
    object sdqValNomencladorVP_NOMENCLADOR: TStringField
      FieldName = 'VP_NOMENCLADOR'
      Required = True
      Size = 1
    end
    object sdqValNomencladorVP_CAPITULO: TStringField
      FieldName = 'VP_CAPITULO'
      Required = True
      Size = 2
    end
    object sdqValNomencladorVP_CODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'VP_CODIGO'
      Required = True
      Size = 15
    end
    object sdqValNomencladorON_DESCRIPCION: TStringField
      FieldName = 'ON_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqValNomencladorVP_VIGENCIADESDE: TDateTimeField
      FieldName = 'VP_VIGENCIADESDE'
      Required = True
    end
    object sdqValNomencladorVIGENCIAHASTA: TDateTimeField
      DisplayLabel = 'Vigencia hasta'
      FieldName = 'VIGENCIAHASTA'
      Required = True
    end
    object sdqValNomencladorVP_MULTIPLICADOR: TFloatField
      FieldName = 'VP_MULTIPLICADOR'
    end
    object sdqValNomencladorVP_MULTIGASTOS: TFloatField
      FieldName = 'VP_MULTIGASTOS'
    end
    object sdqValNomencladorVP_VALOR: TFloatField
      FieldName = 'VP_VALOR'
    end
    object sdqValNomencladorVP_ANESTESIA: TStringField
      FieldName = 'VP_ANESTESIA'
      Size = 1
    end
    object sdqValNomencladorVP_HIV: TStringField
      FieldName = 'VP_HIV'
      Size = 1
    end
    object sdqValNomencladorVP_ANTITETANICA: TStringField
      FieldName = 'VP_ANTITETANICA'
      Size = 1
    end
    object sdqValNomencladorVP_SESIONES: TFloatField
      FieldName = 'VP_SESIONES'
    end
    object sdqValNomencladorON_ID: TFloatField
      FieldName = 'ON_ID'
    end
    object sdqValNomencladorCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object sdqValNomencladorSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqValNomencladorVP_VALORGASTOS: TFloatField
      FieldName = 'VP_VALORGASTOS'
    end
    object sdqValNomencladorVP_VALORHONORARIOS: TFloatField
      FieldName = 'VP_VALORHONORARIOS'
    end
    object sdqValNomencladorVP_SINIESTRO: TFloatField
      FieldName = 'VP_SINIESTRO'
    end
    object sdqValNomencladorVP_ORDEN: TFloatField
      FieldName = 'VP_ORDEN'
    end
    object sdqValNomencladorVP_RECAIDA: TFloatField
      FieldName = 'VP_RECAIDA'
    end
    object sdqValNomencladorVP_MONTO_MINIMO: TFloatField
      DisplayLabel = 'Monto m'#237'nimo'
      FieldName = 'VP_MONTO_MINIMO'
    end
    object sdqValNomencladorVP_SUMA_FIJA: TFloatField
      DisplayLabel = 'Suma fija'
      FieldName = 'VP_SUMA_FIJA'
    end
    object sdqValNomencladorVP_ABONA_RETORNO: TStringField
      DisplayLabel = 'Permiso facturar retorno'
      FieldName = 'VP_ABONA_RETORNO'
      Size = 1
    end
    object sdqValNomencladorVP_DEFAULT: TStringField
      DisplayLabel = 'Default'
      FieldName = 'VP_DEFAULT'
      Size = 1
    end
    object sdqValNomencladorVP_VALORDEAMP: TStringField
      FieldName = 'VP_VALORDEAMP'
    end
    object sdqValNomencladorON_CABECERA: TStringField
      FieldName = 'ON_CABECERA'
      Size = 1
    end
    object sdqValNomencladorVP_UNICALIQUIDACION: TStringField
      FieldName = 'VP_UNICALIQUIDACION'
      Size = 1
    end
    object sdqValNomencladorVP_FECHAALTA: TDateTimeField
      FieldName = 'VP_FECHAALTA'
    end
    object sdqValNomencladorVP_USUALTA: TStringField
      FieldName = 'VP_USUALTA'
    end
    object sdqValNomencladorVP_KM_INCLUIDOS: TFloatField
      FieldName = 'VP_KM_INCLUIDOS'
    end
    object sdqValNomencladorVP_USUMODIF: TStringField
      FieldName = 'VP_USUMODIF'
    end
    object sdqValNomencladorVP_FECHAMODIF: TDateTimeField
      FieldName = 'VP_FECHAMODIF'
    end
    object sdqValNomencladorVP_VIAJE_EXCLUSIVO: TFloatField
      FieldName = 'VP_VIAJE_EXCLUSIVO'
    end
    object sdqValNomencladorVP_VIAJE_NOCTURNO: TFloatField
      FieldName = 'VP_VIAJE_NOCTURNO'
    end
    object sdqValNomencladorVP_VIAJE_FINDESEMANA: TFloatField
      FieldName = 'VP_VIAJE_FINDESEMANA'
    end
  end
  object qpValNomenclador: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Nom.'
        TitleAlignment = taCenter
        DataField = 'VP_NOMENCLADOR'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Cap.'
        TitleAlignment = taCenter
        DataField = 'VP_CAPITULO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'VP_CODIGO'
        Alignment = taRightJustify
        MaxLength = 7
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ON_DESCRIPCION'
        MaxLength = 48
      end
      item
        Title = 'Vig.Desde'
        TitleAlignment = taCenter
        DataField = 'VP_VIGENCIADESDE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Vig.Hasta'
        TitleAlignment = taCenter
        DataField = 'VIGENCIAHASTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Multip.'
        TitleAlignment = taCenter
        DataField = 'VP_MULTIPLICADOR'
        Alignment = taRightJustify
        MaxLength = 9
      end
      item
        Title = 'Valor'
        TitleAlignment = taCenter
        DataField = 'VP_VALOR'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Ret.'
        TitleAlignment = taCenter
        DataField = 'VP_ABONA_RETORNO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'V. Gastos'
        TitleAlignment = taCenter
        DataField = 'VP_VALORGASTOS'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'V. Honor.'
        TitleAlignment = taCenter
        DataField = 'VP_VALORHONORARIOS'
        Alignment = taRightJustify
        MaxLength = 8
      end
      item
        Title = 'M. Minimo'
        TitleAlignment = taCenter
        DataField = 'VP_MONTO_MINIMO'
        Alignment = taRightJustify
        MaxLength = 8
      end
      item
        Title = 'Default'
        TitleAlignment = taCenter
        DataField = 'VP_DEFAULT'
        Alignment = taCenter
        MaxLength = 0
      end>
    DataSource = dsValNomenclador
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Valores del Nomenclador'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = qpValNomencladorGetCellParams
    Left = 488
    Top = 288
  end
  object edlgValMomenclador: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqValNomenclador
    Fields = <
      item
        DataField = 'VP_NOMENCLADOR'
        Title = 'Nom.'
      end
      item
        DataField = 'VP_CAPITULO'
        Title = 'Capitulo'
      end
      item
        DataField = 'VP_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'ON_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'VP_VIGENCIADESDE'
        Title = 'V.Desde'
      end
      item
        DataField = 'VIGENCIAHASTA'
        Title = 'V.Hasta'
      end
      item
        DataField = 'VP_MULTIPLICADOR'
        Title = 'Multiplicador'
      end
      item
        DataField = 'VP_VALOR'
        Title = 'Valor'
      end
      item
        DataField = 'VP_VALORGASTOS'
        Title = 'Valor gastos'
      end
      item
        DataField = 'VP_VALORHONORARIOS'
        Title = 'Valor honorarios'
      end
      item
        DataField = 'VP_SUMA_FIJA'
        Title = 'Suma Fija'
      end
      item
        DataField = 'VP_MONTO_MINIMO'
        Title = 'Monto M'#237'n'
      end>
    OutputFile = 'ValNomenc.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 516
    Top = 288
  end
  object sdValNomenclador: TSortDialog
    Caption = 'Orden'
    DataSet = sdqValNomenclador
    SortFields = <
      item
        Title = 'Nomenclador'
        DataField = 'VP_NOMENCLADOR'
        FieldIndex = 1
      end
      item
        Title = 'Capitulo'
        DataField = 'VP_CAPITULO'
        FieldIndex = 2
      end
      item
        Title = 'C'#243'digo'
        DataField = 'VP_CODIGO'
        FieldIndex = 3
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ON_DESCRIPCION'
        FieldIndex = 4
      end
      item
        Title = 'V.Desde'
        DataField = 'VP_VIGENCIADESDE'
        FieldIndex = 5
      end
      item
        Title = 'V.Hasta'
        DataField = 'VIGENCIAHASTA'
        FieldIndex = 6
      end
      item
        Title = 'Multip. Honor.'
        DataField = 'VP_MULTIPLICADOR'
        FieldIndex = 7
      end
      item
        Title = 'Multip. Gastos'
        DataField = 'VP_MULTIGASTOS'
        FieldIndex = 8
      end
      item
        Title = 'Valor'
        DataField = 'VP_VALOR'
        FieldIndex = 9
      end
      item
        Title = 'V. Gastos'
        DataField = 'VP_VALORGASTOS'
        FieldIndex = 0
      end
      item
        Title = 'V. Honorarios'
        DataField = 'VP_VALORHONORARIOS'
        FieldIndex = 0
      end
      item
        Title = 'Anestesia'
        DataField = 'VP_ANESTESIA'
        FieldIndex = 10
      end
      item
        Title = 'HIV'
        DataField = 'VP_HIV'
        FieldIndex = 11
      end
      item
        Title = 'Antitetanica'
        DataField = 'VP_ANTITETANICA'
        FieldIndex = 12
      end
      item
        Title = 'Sesiones'
        DataField = 'VP_SESIONES'
        FieldIndex = 13
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 544
    Top = 288
  end
  object sccNomenclador: TShortCutControl
    ShortCuts = <
      item
        Key = 16449
        OnShortCutPress = tbAgregarNomClick
        LinkControl = tbAgregarNom
      end
      item
        Key = 16453
        OnShortCutPress = tbEliminarNomClick
        LinkControl = tbEliminarNom
      end
      item
        Key = 16466
        OnShortCutPress = tbOrdenarNomClick
        LinkControl = tbOrdenarNom
      end
      item
        Key = 16472
        OnShortCutPress = tbExportarNomClick
        LinkControl = tbExportarNom
      end
      item
        Key = 16461
        OnShortCutPress = tbImprimirNomClick
        LinkControl = tbImprimirNom
      end>
    Enabled = False
    Left = 529
    Top = 40
  end
  object SDQVUMed: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT up_unidad, um_descripcion, up_vigenciadesde, up_vigenciah' +
        'asta, up_valor, up_usualta, up_fechaalta, up_usumodif,'
      '       up_fechamodif, up_prestador'
      '  FROM art.sum_unidadesmedicas, art.sup_unidadprestador'
      ' WHERE up_prestador = :pprestador'
      '   AND up_unidad = um_codigo'
      '   AND up_fechabaja IS NULL')
    Left = 432
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPrestador'
        ParamType = ptInput
        Value = '5'
      end>
    object SDQVUMedUP_UNIDAD: TStringField
      FieldName = 'UP_UNIDAD'
      Required = True
      Size = 2
    end
    object SDQVUMedUM_DESCRIPCION: TStringField
      FieldName = 'UM_DESCRIPCION'
      Required = True
      Size = 50
    end
    object SDQVUMedUP_VIGENCIADESDE: TDateTimeField
      FieldName = 'UP_VIGENCIADESDE'
      Required = True
    end
    object SDQVUMedUP_VIGENCIAHASTA: TDateTimeField
      FieldName = 'UP_VIGENCIAHASTA'
    end
    object SDQVUMedUP_VALOR: TFloatField
      FieldName = 'UP_VALOR'
      Required = True
    end
    object SDQVUMedUP_USUALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'UP_USUALTA'
    end
    object SDQVUMedUP_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'UP_FECHAALTA'
    end
    object SDQVUMedUP_USUMODIF: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'UP_USUMODIF'
    end
    object SDQVUMedUP_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modif.'
      FieldName = 'UP_FECHAMODIF'
    end
    object SDQVUMedup_prestador: TFloatField
      FieldName = 'up_prestador'
    end
  end
  object DSVUMed: TDataSource
    DataSet = SDQVUMed
    Left = 460
    Top = 232
  end
  object QPVUMed: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Unidad'
        TitleAlignment = taCenter
        DataField = 'UP_UNIDAD'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'UM_DESCRIPCION'
        MaxLength = 65
      end
      item
        Title = 'Vigencia Desde'
        TitleAlignment = taCenter
        DataField = 'UP_VIGENCIADESDE'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Vigencia Hasta'
        TitleAlignment = taCenter
        DataField = 'UP_VIGENCIAHASTA'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Valor'
        TitleAlignment = taCenter
        DataField = 'UP_VALOR'
        Alignment = taCenter
        MaxLength = 0
      end>
    DataSource = DSVUMed
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Valores de Unidades M'#233'dicas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = qpValNomencladorGetCellParams
    Left = 488
    Top = 232
  end
  object sdqEmpresas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT PE_ID, PE_CUIT CUIT, MP_NOMBRE EMPRESA, PE_OBSERVACIONES ' +
        'OBSERVACIONES,'
      
        '       PE_VIGENCIADESDE V_DESDE, PE_VIGENCIAHASTA V_HASTA, PE_FE' +
        'CHABAJA FECHABAJA'
      '  FROM MPE_PRESTADOREMPRESA, CMP_EMPRESAS'
      ' WHERE PE_CUIT=MP_CUIT'
      '   AND PE_PRESTADOR =:pPrestador'
      ' '
      ' '
      ' ')
    Left = 288
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pPrestador'
        ParamType = ptInput
      end>
  end
  object dsEmpresas: TDataSource
    DataSet = sdqEmpresas
    Left = 316
    Top = 232
  end
  object qpEmpresas: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'CUIT'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EMPRESA'
        Width = 1000
        MaxLength = 0
      end
      item
        Title = 'Vig. Desde'
        TitleAlignment = taCenter
        DataField = 'V_DESDE'
        Alignment = taCenter
        Width = 260
        MaxLength = 0
      end
      item
        Title = 'Vig. Hasta'
        TitleAlignment = taCenter
        DataField = 'V_HASTA'
        Alignment = taCenter
        Width = 260
        MaxLength = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        Width = 1000
        MaxLength = 0
      end>
    DataSource = dsEmpresas
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Empresas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxPortrait
    PageSize = psLetter
    OnGetCellParams = qpEmpresasGetCellParams
    Left = 344
    Top = 232
  end
  object edlgEmpresas: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqEmpresas
    Fields = <
      item
        DataField = 'CUIT'
        Title = 'CUIT'
        Alignment = taCenter
      end
      item
        DataField = 'EMPRESA'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'V_DESDE'
        Title = 'Vig. Desde'
        Alignment = taCenter
      end
      item
        DataField = 'V_HASTA'
        Title = 'Vig. Hasta'
        Alignment = taCenter
      end
      item
        DataField = 'OBSERVACIONES'
        Title = 'Observaciones'
      end>
    OutputFile = 'Empresas.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 372
    Top = 232
  end
  object sdEmpresas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEmpresas
    SortFields = <
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EMPRESA'
        FieldIndex = 1
      end
      item
        Title = 'Vig. Desde'
        DataField = 'V_DESDE'
        FieldIndex = 3
      end
      item
        Title = 'Vig. Hasta'
        DataField = 'V_HASTA'
        FieldIndex = 4
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        FieldIndex = 2
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 400
    Top = 232
  end
  object qpValNomencladorAMP: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Identificador'
        DataField = 'es_codigo'
        MaxLength = 50
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 30
      end
      item
        Title = 'Vig. Desde'
        TitleAlignment = taCenter
        DataField = 'pd_VIGENCIADESDE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Vig. Hasta'
        TitleAlignment = taCenter
        DataField = 'pd_VIGENCIAHASTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Valor'
        TitleAlignment = taCenter
        DataField = 'pd_VALOR'
        Alignment = taRightJustify
        MaxLength = 9
      end>
    DataSource = dsValoresPrestador
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Valores del Convenio'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 594
    Top = 33
  end
  object edlgValMomencladorAMP: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqValoresPrestador
    Fields = <
      item
        DataField = 'es_codigo'
        Title = 'Identificador'
      end
      item
        DataField = 'ES_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'pd_VIGENCIADESDE'
        Title = 'Vig. Desde'
        Alignment = taCenter
      end
      item
        DataField = 'pd_VIGENCIAHASTA'
        Title = 'Vig. Hasta'
        Alignment = taCenter
      end
      item
        DataField = 'pd_VALOR'
        Title = 'Valor'
        Alignment = taRightJustify
      end>
    OutputFile = 'ValConvenio.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 626
    Top = 41
  end
  object pmnuValoresConvenio: TPopupMenu
    Left = 650
    Top = 13
    object mnuAgregar: TMenuItem
      Action = actAgregarConv
    end
    object mnuEliminar: TMenuItem
      Action = actEliminarConv
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuOrdenar: TMenuItem
      Action = actOrdenarConv
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuExportar: TMenuItem
      Action = actExportarConv
    end
    object mnuImprimir: TMenuItem
      Action = actImprimirConv
    end
  end
  object ActionListAMP: TActionList
    Images = frmPrincipal.imgGenColor
    Left = 666
    Top = 33
    object actAgregarConv: TAction
      Caption = 'Agregar'
      Hint = 'Agregar'
      ImageIndex = 0
      ShortCut = 16449
    end
    object actEliminarConv: TAction
      Caption = 'Eliminar'
      Hint = 'Eliminar'
      ImageIndex = 2
      ShortCut = 16453
    end
    object actOrdenarConv: TAction
      Caption = 'Ordenar'
      Hint = 'Ordenar'
      ImageIndex = 5
      ShortCut = 16463
    end
    object actExportarConv: TAction
      Caption = 'Exportar'
      Hint = 'Exportar'
      ImageIndex = 1
      ShortCut = 16472
    end
    object actImprimirConv: TAction
      Caption = 'Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 7
      ShortCut = 16457
    end
  end
  object dsContratos: TDataSource
    DataSet = sdqContratos
    Left = 288
    Top = 201
  end
  object sdqContratos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqContratosAfterScroll
    SQL.Strings = (
      
        'SELECT   pc_idcontrato, pc_vigenciadesde, pc_vigenciahasta, pc_t' +
        'ipocontrato, '
      
        '         pc_sumatoriamodulos, pc_facturaciondesde, pc_facturacio' +
        'nhasta, '
      
        '         pc_plazorefacturacion, pc_medicacionextra, pc_generalid' +
        'ades, '
      
        '         tb_descripcion desccontrato, pc_renovautomatica, pc_hab' +
        'ilitacion,'
      '         pc_documento, pc_contratosocial, pc_actaautoridades,'
      
        '         pc_cv, pc_titulo, pc_matricula, pc_fechacontsocial, pc_' +
        'fechaactaauto,'
      
        '         pc_complejidad, pc_cartacomp, pc_respcivil, pc_fechavto' +
        'habilitacion, '
      '         pc_fecharespcivil'
      '    FROM cpc_prestadorcontrato, ctb_tablas'
      '   WHERE tb_codigo(+) = pc_tipocontrato'
      '     AND tb_clave(+) = '#39'TICON'#39
      '     AND pc_fechabaja IS NULL'
      '     AND pc_idprestador = :pprestador'
      'ORDER BY pc_vigenciahasta DESC'
      '')
    Left = 260
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPrestador'
        ParamType = ptInput
      end>
    object sdqContratosPC_IDCONTRATO: TFloatField
      FieldName = 'PC_IDCONTRATO'
      Required = True
    end
    object sdqContratosPC_VIGENCIADESDE: TDateTimeField
      FieldName = 'PC_VIGENCIADESDE'
    end
    object sdqContratosPC_VIGENCIAHASTA: TDateTimeField
      FieldName = 'PC_VIGENCIAHASTA'
    end
    object sdqContratosPC_TIPOCONTRATO: TStringField
      FieldName = 'PC_TIPOCONTRATO'
      Size = 5
    end
    object sdqContratosPC_SUMATORIAMODULOS: TStringField
      FieldName = 'PC_SUMATORIAMODULOS'
      Size = 1
    end
    object sdqContratosPC_FACTURACIONDESDE: TFloatField
      FieldName = 'PC_FACTURACIONDESDE'
    end
    object sdqContratosPC_FACTURACIONHASTA: TFloatField
      FieldName = 'PC_FACTURACIONHASTA'
    end
    object sdqContratosPC_PLAZOREFACTURACION: TFloatField
      FieldName = 'PC_PLAZOREFACTURACION'
    end
    object sdqContratosPC_MEDICACIONEXTRA: TStringField
      FieldName = 'PC_MEDICACIONEXTRA'
      Size = 1
    end
    object sdqContratosPC_GENERALIDADES: TStringField
      FieldName = 'PC_GENERALIDADES'
      Size = 4000
    end
    object sdqContratosDESCCONTRATO: TStringField
      FieldName = 'DESCCONTRATO'
      Size = 150
    end
    object sdqContratosPC_RENOVAUTOMATICA: TStringField
      FieldName = 'PC_RENOVAUTOMATICA'
      Size = 1
    end
    object sdqContratosPC_HABILITACION: TStringField
      FieldName = 'PC_HABILITACION'
      Size = 1
    end
    object sdqContratosPC_DOCUMENTO: TStringField
      FieldName = 'PC_DOCUMENTO'
      Size = 1
    end
    object sdqContratosPC_CONTRATOSOCIAL: TStringField
      FieldName = 'PC_CONTRATOSOCIAL'
      Size = 1
    end
    object sdqContratosPC_ACTAAUTORIDADES: TStringField
      FieldName = 'PC_ACTAAUTORIDADES'
      Size = 1
    end
    object sdqContratosPC_CV: TStringField
      FieldName = 'PC_CV'
      Size = 1
    end
    object sdqContratosPC_TITULO: TStringField
      FieldName = 'PC_TITULO'
      Size = 1
    end
    object sdqContratosPC_MATRICULA: TStringField
      FieldName = 'PC_MATRICULA'
      Size = 1
    end
    object sdqContratosPC_FECHACONTSOCIAL: TDateTimeField
      FieldName = 'PC_FECHACONTSOCIAL'
    end
    object sdqContratosPC_FECHAACTAAUTO: TDateTimeField
      FieldName = 'PC_FECHAACTAAUTO'
    end
    object sdqContratosPC_COMPLEJIDAD: TStringField
      FieldName = 'PC_COMPLEJIDAD'
      Size = 1
    end
    object sdqContratosPC_CARTACOMP: TStringField
      FieldName = 'PC_CARTACOMP'
      Size = 1
    end
    object sdqContratosPC_RESPCIVIL: TStringField
      FieldName = 'PC_RESPCIVIL'
      Size = 1
    end
    object sdqContratosPC_FECHAVTOHABILITACION: TDateTimeField
      FieldName = 'PC_FECHAVTOHABILITACION'
    end
    object sdqContratosPC_FECHARESPCIVIL: TDateTimeField
      FieldName = 'PC_FECHARESPCIVIL'
    end
  end
  object sdContratos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqContratos
    SortFields = <
      item
        Title = 'Vigencia desde'
        DataField = 'PC_VIGENCIADESDE'
        FieldIndex = 0
      end
      item
        Title = 'Vigencia hasta'
        DataField = 'PC_VIGENCIAHASTA'
        FieldIndex = 0
      end
      item
        Title = 'Tipo contrato'
        DataField = 'DESCCONTRATO'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 400
    Top = 260
  end
  object edlgContratos: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqContratos
    Fields = <
      item
        DataField = 'PC_VIGENCIADESDE'
        Title = 'Vigencia desde'
        Alignment = taCenter
      end
      item
        DataField = 'PC_VIGENCIAHASTA'
        Title = 'Vigencia hasta'
        Alignment = taCenter
      end
      item
        DataField = 'DESCCONTRATO'
        Title = 'Tipo contrato'
      end
      item
        DataField = 'PC_FACTURACIONDESDE'
        Title = 'Factura desde'
      end
      item
        DataField = 'PC_FACTURACIONHASTA'
        Title = 'Factura hasta'
      end
      item
        DataField = 'PC_PLAZOREFACTURACION'
        Title = 'Plazo refact.'
      end
      item
        DataField = 'PC_MEDICACIONEXTRA'
        Title = 'Med.Extra'
      end
      item
        DataField = 'PC_SUMATORIAMODULOS'
        Title = 'Suma m'#243'dulos'
      end
      item
        DataField = 'PC_DOCUMENTO'
        Title = 'Documento'
      end
      item
        DataField = 'PC_GENERALIDADES'
        Title = 'Observaciones'
      end>
    OutputFile = 'Contratos.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 372
    Top = 260
  end
  object qpContratos: TQueryPrint
    Fields = <
      item
        Title = 'Vig.Desde'
        TitleAlignment = taCenter
        DataField = 'PC_VIGENCIADESDE'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Vig.Hasta'
        TitleAlignment = taCenter
        DataField = 'PC_VIGENCIAHASTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Tipo contrato'
        DataField = 'DESCCONTRATO'
        MaxLength = 25
      end
      item
        Title = 'Fact.D'
        TitleAlignment = taCenter
        DataField = 'PC_FACTURACIONDESDE'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Fact.H'
        TitleAlignment = taCenter
        DataField = 'PC_FACTURACIONHASTA'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Plazo'
        TitleAlignment = taCenter
        DataField = 'PC_PLAZOREFACTURACION'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Extra'
        TitleAlignment = taCenter
        DataField = 'PC_MEDICACIONEXTRA'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Suma'
        TitleAlignment = taCenter
        DataField = 'PC_SUMATORIAMODULOS'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Observaciones'
        DataField = 'PC_GENERALIDADES'
        MaxLength = 0
      end>
    DataSource = dsContratos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -13
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -11
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    Left = 344
    Top = 260
  end
  object sdqRegiones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT RP_REGION, RP_DOMICILIO, TB_DESCRIPCION'
      '  FROM CRP_REGIONESPRESTADOR, CTB_TABLAS'
      ' WHERE RP_REGION = TB_CODIGO'
      '   AND RP_PRESTADOR = :pPrestador'
      '   AND TB_CLAVE = '#39'REGSA'#39
      '   AND  RP_FECHABAJA IS NULL'
      '')
    Left = 809
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pPrestador'
        ParamType = ptInput
      end>
  end
  object dsRegiones: TDataSource
    DataSet = sdqRegiones
    Left = 837
    Top = 472
  end
  object rxmValoresPrestaciones: TRxMemoryData
    FieldDefs = <
      item
        Name = 'es_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'es_descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'pd_valor'
        DataType = ftFloat
      end
      item
        Name = 'pd_vigenciadesde'
        DataType = ftDate
      end
      item
        Name = 'es_fechabaja'
        DataType = ftDateTime
      end>
    AfterScroll = rxmValoresPrestacionesAfterScroll
    Left = 837
    Top = 444
    object rxmValoresPrestacioneses_codigo: TStringField
      FieldName = 'es_codigo'
    end
    object rxmValoresPrestacioneses_descripcion: TStringField
      DisplayWidth = 100
      FieldName = 'es_descripcion'
      Size = 100
    end
    object rxmValoresPrestacionespd_valor: TFloatField
      FieldName = 'pd_valor'
    end
    object rxmValoresPrestacionespd_vigenciadesde: TDateTimeField
      FieldName = 'pd_vigenciadesde'
    end
    object rxmValoresPrestacioneses_fechabaja: TDateTimeField
      FieldName = 'es_fechabaja'
    end
  end
  object sdqValoresPrestaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DISTINCT ca_identificador, es_codigo, pd_idpresupuesto, e' +
        's_descripcion,'
      '                pd_idtipovalor, pd_valor, pd_vigenciadesde,'
      
        '                estudios.es_fechabaja, es_idestudio, estudios.es' +
        '_sincosto'
      
        '           FROM (SELECT TO_CHAR(:pprestador) ca_identificador, e' +
        's_codigo,'
      '                        TO_NUMBER(DECODE(:idpresupuesto,'
      '                                         -1, NULL,'
      '                                         0, NULL,'
      
        '                                         :idpresupuesto)) pd_idp' +
        'resupuesto,'
      '                        UPPER(es_descripcion) es_descripcion,'
      '                        1 pd_idtipovalor, NULL pd_valor,'
      '                        NULL pd_vigenciadesde, es_fechabaja,'
      '                        es_id AS es_idestudio, es_sincosto'
      '                   FROM art.aes_estudios aes'
      '                  WHERE NOT EXISTS(SELECT 1'
      
        '                                     FROM comunes.cpd_prestadore' +
        'studio'
      
        '                                    WHERE pd_idprestador = :ppre' +
        'stador'
      
        '                                      AND pd_idestudio = es_codi' +
        'go'
      
        '                                      AND pd_vigenciahasta IS NU' +
        'LL'
      '                                      AND pd_fechabaja IS NULL'
      '                                      AND (   pd_idpresupuesto ='
      
        '                                                                ' +
        ':idpresupuesto'
      
        '                                           OR (    pd_idpresupue' +
        'sto IS NULL'
      
        '                                               AND :idpresupuest' +
        'o = -1)'
      
        '                                           OR :idpresupuesto = 0' +
        '))'
      '                 UNION ALL'
      '                 SELECT TO_CHAR(pd_idprestador), es_codigo,'
      '                        TO_NUMBER(DECODE(:idpresupuesto,'
      
        '                                         -1, DECODE(pd_idpresupu' +
        'esto,'
      '                                                    NULL, NULL,'
      
        '                                                    :idpresupues' +
        'to),'
      '                                         0, NULL,'
      
        '                                         pd_idpresupuesto, :idpr' +
        'esupuesto)),'
      
        '                        UPPER(es_descripcion) es_descripcion, pd' +
        '_idtipovalor,'
      '                        DECODE(:idpresupuesto,'
      '                               0, NULL,'
      '                               pd_idpresupuesto, pd_valor,'
      '                               -1, DECODE(pd_idpresupuesto,'
      '                                          NULL, pd_valor,'
      '                                          NULL),'
      '                               NULL),'
      '                        DECODE(:idpresupuesto,'
      '                               0, NULL,'
      
        '                               pd_idpresupuesto, pd_vigenciadesd' +
        'e,'
      '                               -1, DECODE(pd_idpresupuesto,'
      
        '                                          NULL, pd_vigenciadesde' +
        ','
      '                                          NULL),'
      '                               NULL),'
      '                        (SELECT es_fechabaja'
      '                           FROM art.aes_estudios aes2'
      
        '                          WHERE aes2.es_codigo = aes.es_codigo) ' +
        'es_fechabaja,'
      '                        es_id AS es_idestudio, es_sincosto'
      
        '                   FROM comunes.cpd_prestadorestudio, art.aes_es' +
        'tudios aes'
      '                  WHERE pd_idprestador = :pprestador'
      '                    AND pd_vigenciahasta IS NULL'
      '                    AND pd_fechabaja IS NULL'
      '                    AND es_codigo = pd_idestudio) estudios'
      ''
      '')
    Left = 869
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end>
  end
  object dsValoresPrestaciones: TDataSource
    DataSet = cdsValoresPrestaciones
    Left = 897
    Top = 444
  end
  object sdqValoresPrestador: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqValoresPrestadorAfterOpen
    SQL.Strings = (
      
        'SELECT   ca_identificador, es_codigo, UPPER(es_descripcion) es_d' +
        'escripcion,'
      '         pd_idtipovalor, pd_valor,'
      
        '         NVL2(pp_id, pp_vigenciadesde, pd_vigenciadesde) pd_vige' +
        'nciadesde,'
      
        '         NVL2(pp_id, pp_vigenciahasta, pd_vigenciahasta) pd_vige' +
        'nciahasta,'
      '         pd_id, es_fechabaja, pd_vigenciahasta VigHastaEstudio'
      '    FROM comunes.cpp_presupuestoprestador,'
      '         comunes.cpd_prestadorestudio,'
      '         art.cpr_prestador cpr,'
      '         art.aes_estudios aes'
      '   WHERE pd_idprestador = :pprestador'
      '     AND pd_idpresupuesto = pp_id (+)'
      '     AND ca_identificador = pd_idprestador'
      '     AND es_codigo = pd_idestudio'
      '     AND pd_fechabaja IS NULL'
      'UNION'
      '  SELECT ca_identificador, NULL es_codigo,'
      
        '         UPPER (tv_descripcion) es_descripcion, pd_idtipovalor, ' +
        'pd_valor,'
      
        '         NVL2(pp_id, pp_vigenciadesde, pd_vigenciadesde) pd_vige' +
        'nciadesde,'
      
        '         NVL2(pp_id, pp_vigenciahasta, pd_vigenciahasta) pd_vige' +
        'nciahasta,'
      
        '         pd_id, NULL es_fechabaja, pd_vigenciahasta VigHastaEstu' +
        'dio'
      '    FROM comunes.cpp_presupuestoprestador,'
      '         comunes.cpd_prestadorestudio,'
      '         art.cpr_prestador cpr,'
      '         comunes.ctv_tipovalor tv'
      '   WHERE pd_idprestador = :pprestador'
      '     AND pd_idpresupuesto = pp_id (+)'
      '     AND pd_idtipovalor <> 1'
      '     AND ca_identificador = pd_idprestador'
      '     AND tv.tv_id = pd_idtipovalor'
      '     AND pd_fechabaja IS NULL'
      'ORDER BY pd_idtipovalor, es_codigo')
    Left = 288
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end>
  end
  object dsValoresPrestador: TDataSource
    DataSet = sdqValoresPrestador
    Left = 316
    Top = 288
  end
  object pmuVigenciaValoresAMP: TPopupMenu
    Left = 565
    Top = 428
    object pmuVisualizarSloVigentes: TMenuItem
      Caption = 'Visualizar s'#243'lo valores vigentes'
      Checked = True
      OnClick = pmuVisualizarSloVigentesClick
    end
    object pmuVisualizartodoslosvalores: TMenuItem
      Caption = 'Visualizar todos los valores'
      OnClick = pmuVisualizartodoslosvaloresClick
    end
  end
  object sdValNomencladorAMP: TSortDialog
    Caption = 'Orden'
    DataSet = sdqValoresPrestador
    SortFields = <
      item
        Title = 'Identificador'
        DataField = 'es_codigo'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'es_descripcion'
        FieldIndex = 1
      end
      item
        Title = 'Valor'
        DataField = 'pd_valor'
        FieldIndex = 2
      end
      item
        Title = 'Vig. Desde'
        DataField = 'pd_vigenciadesde'
        FieldIndex = 3
      end
      item
        Title = 'Vig. Hasta'
        DataField = 'pd_vigenciahasta'
        FieldIndex = 4
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 400
    Top = 288
  end
  object sdqPrestCP: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT pc_id, pc_idprestador, pc_idcpostal, cp_codigo, cp_locali' +
        'dad,'
      '       pv_descripcion, tb_descripcion'
      '  FROM art.apc_prestadorcpostal,'
      '       art.ccp_codigopostal,'
      '       art.cpv_provincias,'
      '       art.ctb_tablas'
      ' WHERE cp_id = pc_idcpostal'
      '   AND pv_codigo = cp_provincia'
      '   AND tb_clave = '#39'REGSA'#39
      '   AND tb_codigo = cp_regionsanitaria'
      '   AND pc_idprestador = :pprestador'
      '   AND pc_fechabaja IS NULL'
      '')
    Left = 200
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end>
  end
  object dsPrestCP: TDataSource
    DataSet = sdqPrestCP
    Left = 228
    Top = 232
  end
  object sdPrestCP: TSortDialog
    Caption = 'Orden'
    DataSet = sdqPrestCP
    SortFields = <
      item
        Title = 'C.Postal'
        DataField = 'cp_codigo'
        FieldIndex = 0
      end
      item
        Title = 'Localidad'
        DataField = 'cp_localidad'
        FieldIndex = 1
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 2
      end
      item
        Title = 'Regi'#243'n Sanitaria'
        DataField = 'tb_descripcion'
        FieldIndex = 3
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 256
    Top = 232
  end
  object qpPrestCP: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsPrestCP
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Localidades de prestaci'#243'n'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 344
    Top = 288
  end
  object edlgPrestCP: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqPrestCP
    Fields = <>
    OutputFile = 'PrestacionesCP.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 372
    Top = 288
  end
  object edlgValUnMedicas: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = SDQVUMed
    Fields = <
      item
        DataField = 'UP_UNIDAD'
        Title = 'Unidad'
      end
      item
        DataField = 'UM_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'UP_VIGENCIADESDE'
        Title = 'V.Desde'
      end
      item
        DataField = 'UP_VIGENCIAHASTA'
        Title = 'V.Hasta'
      end
      item
        DataField = 'UP_VALOR'
        Title = 'Valor'
      end>
    OutputFile = 'ValUnMedicas.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 516
    Top = 232
  end
  object sdqPresupuestosAMP: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        ' SELECT MIN(pp_id) pp_id, to_char(pp_nropresupuesto) || '#39' - '#39' ||' +
        ' pp_descripcion || decode(pp_fechabaja, null, '#39#39', '#39' (Dado de baj' +
        'a)'#39') as pp_descripcion,'
      '         pp_fechabaja, pp_nropresupuesto'
      
        '    FROM comunes.cpp_presupuestoprestador, afi.aes_establecimien' +
        'to, afi.aem_empresa, afi.aco_contrato'
      '   WHERE pp_idprestador = :pprestador'
      '     and pp_idestablecimiento = es_id'
      '     and es_contrato = co_contrato'
      '     and co_idempresa = em_id'
      'GROUP BY pp_descripcion, pp_fechabaja, pp_nropresupuesto'
      'ORDER BY 2 desc')
    Left = 172
    Top = 201
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end>
  end
  object dsPresupuestosAMP: TDataSource
    DataSet = sdqPresupuestosAMP
    Left = 200
    Top = 201
  end
  object pmuVigenciaValoresNomenclador: TPopupMenu
    Left = 537
    Top = 427
    object mnuVisualizarSoloVigentes_Nomenclador: TMenuItem
      Caption = 'Visualizar s'#243'lo valores vigentes'
      Checked = True
      OnClick = mnuVisualizarSoloVigentes_NomencladorClick
    end
    object mnuVisualizarTodos_Nomenclador: TMenuItem
      Caption = 'Visualizar todos los valores'
      OnClick = mnuVisualizarTodos_NomencladorClick
    end
  end
  object pmuValoresAMP: TPopupMenu
    Left = 565
    Top = 452
    object Seleccionartodos1: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = Seleccionartodos1Click
    end
    object Noseleccionarninguno1: TMenuItem
      Caption = 'No seleccionar ninguno'
      OnClick = Noseleccionarninguno1Click
    end
  end
  object SDVUMed: TSortDialog
    Caption = 'Orden'
    DataSet = SDQVUMed
    SortFields = <
      item
        Title = 'Unidad'
        DataField = 'UP_UNIDAD'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'UM_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Vig. desde'
        DataField = 'UP_VIGENCIADESDE'
        FieldIndex = 0
      end
      item
        Title = 'Vig. hasta'
        DataField = 'UP_VIGENCIAHASTA'
        FieldIndex = 0
      end
      item
        Title = 'Valor'
        DataField = 'UP_VALOR'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 544
    Top = 232
  end
  object sdqEmpresasPresupuestoAMP: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqEmpresasPresupuestoAMPAfterOpen
    AfterScroll = sdqEmpresasPresupuestoAMPAfterScroll
    SQL.Strings = (
      
        'SELECT   pp_id, em_cuit, em_nombre, es_contrato, es_nroestableci' +
        ', es_nombre,'
      
        '         es_id, pp_idsolicitud, pp_fechaaprobacion, pp_usuaproba' +
        'cion, em_id, es_localidad'
      '    FROM aem_empresa, aco_contrato, aes_establecimiento,'
      '         comunes.cpp_presupuestoprestador'
      '   WHERE pp_nropresupuesto = :nropresupuesto'
      '     AND pp_idestablecimiento = es_id'
      '     AND es_contrato = co_contrato'
      '     AND co_idempresa = em_id'
      'ORDER BY 2')
    Left = 200
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nropresupuesto'
        ParamType = ptInput
      end>
  end
  object dsEmpresasPresupuestoAMP: TDataSource
    DataSet = sdqEmpresasPresupuestoAMP
    Left = 228
    Top = 288
  end
  object sdqSolicitudPresupuesto: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT sp_id, sp_operativo'
      '  FROM comunes.csd_solicitud_det_presupuesto,'
      '       comunes.csp_solicitudpresupuesto'
      ' WHERE sd_idprestador = :pidprestador'
      '   AND sd_fecha_recepcion IS NOT NULL'
      '   AND sd_idsolicitudpresupuesto = sp_id'
      '   AND sp_idestablecimiento = :pidestableci'
      '   AND sp_contrato = :pcontrato')
    Left = 280
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pcontrato'
        ParamType = ptInput
      end>
  end
  object dsSolicitudPresupuesto: TDataSource
    DataSet = sdqSolicitudPresupuesto
    Left = 307
    Top = 360
  end
  object dsExamenes: TDataSource
    DataSet = sdqExamenes
    Left = 308
    Top = 388
  end
  object sdqExamenes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqExamenesAfterScroll
    SQL.Strings = (
      
        'SELECT   ep_id, ep_descripcion, ep_vigenciadesde, ep_vigenciahas' +
        'ta, ep_valor valor'
      '    FROM comunes.cep_examenespreocupacionales'
      '   WHERE ep_idprestador = :pprestador'
      '     AND ep_fechabaja IS NULL')
    Left = 280
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pprestador'
        ParamType = ptInput
      end>
  end
  object dsValoresExamen: TDataSource
    DataSet = sdqValoresExamen
    Left = 308
    Top = 416
  end
  object sdqValoresExamen: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ei_id, es_codigo, es_descripcion'
      '  FROM comunes.cei_estudiosincluidos, art.aes_estudios'
      ' WHERE ei_idestudio = es_id'
      '   AND ei_idexamen = :idexamen'
      '   AND ei_fechabaja IS NULL'
      '   AND es_fechabaja IS NULL'
      '')
    Left = 280
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexamen'
        ParamType = ptInput
      end>
  end
  object pmuExamenes: TPopupMenu
    Left = 13
    Top = 329
    object mnuVigentesExamenes: TMenuItem
      Caption = 'Visualizar s'#243'lo valores vigentes'
      OnClick = mnuVigentesExamenesClick
    end
    object mnuTodosExamenes: TMenuItem
      Caption = 'Visualizar todos los valores'
      OnClick = mnuTodosExamenesClick
    end
  end
  object sdExamenes: TSortDialog
    Caption = 'Orden'
    DataSet = sdqExamenes
    SortFields = <
      item
        Title = 'Descripci'#243'n'
        DataField = 'ep_descripcion'
        FieldIndex = 0
      end
      item
        Title = 'Valor'
        DataField = 'valor'
        FieldIndex = 0
      end
      item
        Title = 'Vig. desde'
        DataField = 'ep_vigenciadesde'
        FieldIndex = 0
      end
      item
        Title = 'Vig. hasta'
        DataField = 'ep_vigenciahasta'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 392
    Top = 388
  end
  object dsDetalleExamen: TDataSource
    DataSet = sdqDetalleExamen
    Left = 364
    Top = 416
  end
  object sdqDetalleExamen: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   le_id, em_cuit, em_nombre, es_contrato, es_nombre, le_c' +
        'antidad,'
      
        '         le_autorizado, le_fechaaut, le_idempresa, le_establecim' +
        'iento,'
      '         es_nroestableci'
      
        '    FROM aem_empresa, aco_contrato, aes_establecimiento, comunes' +
        '.cle_lotesexamenes'
      '   WHERE le_idexamen = :idexamen'
      '     AND le_establecimiento = es_id'
      '     AND es_contrato = co_contrato'
      '     AND le_idempresa = em_id'
      '     AND le_fechabaja IS NULL'
      'ORDER BY 2')
    Left = 336
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexamen'
        ParamType = ptInput
      end>
  end
  object edlgExamenes: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqExamenes
    Fields = <
      item
        DataField = 'ep_descripcion'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'ep_vigenciadesde'
        Title = 'V.Desde'
      end
      item
        DataField = 'ep_vigenciahasta'
        Title = 'V.Hasta'
      end
      item
        DataField = 'valor'
        Title = 'Valor'
      end>
    OutputFile = 'ValExamenes.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 364
    Top = 388
  end
  object qpExamenes: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Descripci'#243'n'
        DataField = 'ep_descripcion'
        MaxLength = 70
      end
      item
        Title = 'Vig.Desde'
        TitleAlignment = taCenter
        DataField = 'ep_vigenciadesde'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Vig.Hasta'
        TitleAlignment = taCenter
        DataField = 'ep_vigenciahasta'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Valor'
        TitleAlignment = taCenter
        DataField = 'valor'
        Alignment = taRightJustify
        MaxLength = 10
      end>
    DataSource = dsExamenes
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Examenes preocupacionales'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = qpValNomencladorGetCellParams
    Left = 336
    Top = 388
  end
  object sdqSiniestros: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT PS_ID, PS_IDEXPEDIENTE IDEXPEDIENTE, '
      
        '       ART.UTILES.armar_siniestro(EX_SINIESTRO,EX_ORDEN,EX_RECAI' +
        'DA) SINIESTRO, '
      
        '       PS_OBSERVACIONES OBSERVACIONES, PS_VIGENCIADESDE V_DESDE,' +
        ' PS_VIGENCIAHASTA V_HASTA, '
      '       PS_FECHABAJA FECHABAJA, NVL(EX_CAUSAFIN, '#39'0'#39') CAUSAFIN,'
      '       EX_SINIESTRO, EX_ORDEN, EX_RECAIDA'
      '  FROM MPS_PRESTADORSINIESTRO, ART.SEX_EXPEDIENTES'
      ' WHERE PS_IDEXPEDIENTE = EX_ID'
      '   AND PS_PRESTADOR = :pPrestador')
    Left = 421
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pPrestador'
        ParamType = ptInput
      end>
  end
  object dsSiniestros: TDataSource
    DataSet = sdqSiniestros
    Left = 449
    Top = 188
  end
  object sdSiniestros: TSortDialog
    Caption = 'Orden'
    DataSet = sdqSiniestros
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Vigencia Desde'
        DataField = 'V_DESDE'
        FieldIndex = 0
      end
      item
        Title = 'Vigencia Hasta'
        DataField = 'V_HASTA'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 477
    Top = 188
  end
  object edlgSiniestros: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqSiniestros
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'V_DESDE'
        Title = 'Vigencia Desde'
      end
      item
        DataField = 'V_HASTA'
        Title = 'Vigencia Hasta'
      end
      item
        DataField = 'OBSERVACIONES'
        Title = 'Observaciones'
      end>
    OutputFile = 'PrestSiniestros.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 505
    Top = 188
  end
  object qpSiniestros: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Width = 250
        MaxLength = 0
      end
      item
        Title = 'Vigencia Desde'
        DataField = 'V_DESDE'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Vigencia Hasta'
        DataField = 'V_HASTA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        Width = 500
        MaxLength = 0
      end>
    DataSource = dsSiniestros
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Prestadores Siniestros'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 533
    Top = 188
  end
  object dsPersonasLote: TDataSource
    DataSet = sdqPersonasLote
    Left = 780
    Top = 429
  end
  object sdqPersonasLote: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT pl_id, pl_dni, pl_nombre, pl_puesto, pl_mail'
      '  FROM comunes.cpl_personasxlote'
      ' WHERE pl_idlote = :IdLote'
      '   AND pl_fechabaja IS NULL'
      '')
    Left = 392
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdLote'
        ParamType = ptInput
      end>
  end
  object dsHistBajas: TDataSource
    DataSet = sdqHistBajas
    Left = 336
    Top = 263
  end
  object sdqHistBajas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ph_idprestador, ca_descripcion, ph_fecbaja, UBAJA.se_nomb' +
        're UsuBaja, '
      
        '               ph_fecreactivacion, UREAC.se_nombre UsuReact, mp_' +
        'descripcion'
      'FROM     art.cph_prestadorhistbajas, art.cpr_prestador, '
      '               art.use_usuarios UBAJA, art.use_usuarios UREAC,'
      '               SIN.smp_motivobajaprestador'
      'WHERE ph_idprestador = ca_identificador'
      '      AND ph_usubaja = UBAJA.se_usuario(+)'
      '      AND ph_usureactivacion = UREAC.se_usuario(+)'
      '      AND ph_idprestador = :Idprest'
      '      AND ph_idmotivobaja = mp_id(+)'
      '      AND mp_fechabaja is null'
      'ORDER BY ph_id')
    Left = 308
    Top = 263
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Idprest'
        ParamType = ptInput
      end>
  end
  object pmuVigenciaValoresUnidMed: TPopupMenu
    Left = 621
    Top = 200
    object pmuVisualizarSloVigentesUM: TMenuItem
      Caption = 'Visualizar s'#243'lo valores vigentes'
      OnClick = pmuVisualizarSloVigentesUMClick
    end
    object pmuVisualizartodoslosvaloresUM: TMenuItem
      Caption = 'Visualizar todos los valores'
      Checked = True
      OnClick = pmuVisualizartodoslosvaloresUMClick
    end
  end
  object sdqBajaVigencia: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 190
    Top = 264
  end
  object dsBajaVigencia: TDataSource
    DataSet = sdqBajaVigencia
    Left = 218
    Top = 264
  end
  object sdqEstudiosPorEmpresa: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   es_codigo, UPPER (es_descripcion) es_descripcion,'
      
        '         pd_valor, NVL2 (pp_id, pp_vigenciadesde, pd_vigenciades' +
        'de) pd_vigenciadesde'
      ''
      '    FROM comunes.cpp_presupuestoprestador,'
      '         comunes.cpd_prestadorestudio,'
      '         art.cpr_prestador cpr,'
      '         art.aes_estudios aes'
      '   WHERE pp_id = :idpresup'
      '     AND pd_idprestador = :idprest'
      '     AND pd_idpresupuesto = pp_id(+)'
      '     AND ca_identificador = pd_idprestador'
      '     AND es_codigo = pd_idestudio'
      '     AND pd_fechabaja IS NULL'
      'UNION'
      'SELECT   NULL es_codigo,'
      '         UPPER (tv_descripcion) es_descripcion, pd_valor,'
      
        '         NVL2 (pp_id, pp_vigenciadesde, pd_vigenciadesde) pd_vig' +
        'enciadesde'
      ''
      '    FROM comunes.cpp_presupuestoprestador,'
      '         comunes.cpd_prestadorestudio,'
      '         art.cpr_prestador cpr,'
      '         comunes.ctv_tipovalor tv'
      '   WHERE pp_id = :idpresup'
      '     AND pd_idprestador = :idprest'
      '     AND pd_idpresupuesto = pp_id(+)'
      '     AND pd_idtipovalor <> 1'
      '     AND ca_identificador = pd_idprestador'
      '     AND tv.tv_id = pd_idtipovalor'
      '     AND pd_fechabaja IS NULL'
      'ORDER BY es_codigo')
    Left = 937
    Top = 452
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresup'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprest'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresup'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprest'
        ParamType = ptInput
      end>
  end
  object dsEstudiosPorEmpresa: TDataSource
    DataSet = sdqEstudiosPorEmpresa
    Left = 965
    Top = 452
  end
  object sdqPresupDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqPresupDetalleAfterOpen
    SQL.Strings = (
      
        'SELECT DISTINCT ca_identificador, es_codigo, pd_idpresupuesto, e' +
        's_descripcion,'
      '                pd_idtipovalor, pd_valor, pd_vigenciadesde,'
      
        '                estudios.es_fechabaja, es_idestudio, estudios.es' +
        '_sincosto, null pd_vigenciahasta'
      '           FROM hys.hur_ultimorelevamiento,'
      '                hys.v_trabajadores_con_riesgo,'
      
        '                (SELECT TO_CHAR (:idprestador) ca_identificador,' +
        ' es_codigo,'
      '                        TO_NUMBER (DECODE (:idpresupuesto,'
      '                                           -1, NULL,'
      '                                           0, NULL,'
      '                                           :idpresupuesto'
      '                                          )'
      '                                  ) pd_idpresupuesto,'
      '                        UPPER (es_descripcion) es_descripcion,'
      '                        1 pd_idtipovalor, NULL pd_valor,'
      '                        NULL pd_vigenciadesde, es_fechabaja,'
      '                        es_id AS es_idestudio, es_sincosto'
      '                   FROM art.aes_estudios aes'
      '                  WHERE NOT EXISTS ('
      '                           SELECT 1'
      '                             FROM comunes.cpd_prestadorestudio'
      '                            WHERE pd_idprestador = :idprestador'
      '                              AND pd_idestudio = es_codigo'
      '                              AND pd_vigenciahasta IS NULL'
      '                              AND pd_fechabaja IS NULL'
      
        '                              AND (   pd_idpresupuesto = :idpres' +
        'upuesto'
      
        '                                   OR (    pd_idpresupuesto IS N' +
        'ULL'
      '                                       AND :idpresupuesto = -1'
      '                                      )'
      '                                   OR :idpresupuesto = 0'
      '                                  ))'
      '                 UNION ALL'
      '                 SELECT TO_CHAR (pd_idprestador), es_codigo,'
      '                        TO_NUMBER (DECODE (:idpresupuesto,'
      
        '                                           -1, DECODE (pd_idpres' +
        'upuesto,'
      
        '                                                       NULL, NUL' +
        'L,'
      
        '                                                       :idpresup' +
        'uesto'
      '                                                      ),'
      '                                           0, NULL,'
      
        '                                           pd_idpresupuesto, :id' +
        'presupuesto'
      '                                          )'
      '                                  ),'
      
        '                        UPPER (es_descripcion) es_descripcion, p' +
        'd_idtipovalor,'
      '                        DECODE (:idpresupuesto,'
      '                                0, NULL,'
      '                                pd_idpresupuesto, pd_valor,'
      '                                -1, DECODE (pd_idpresupuesto,'
      '                                            NULL, pd_valor,'
      '                                            NULL'
      '                                           ),'
      '                                NULL'
      '                               ),'
      '                        DECODE (:idpresupuesto,'
      '                                0, NULL,'
      
        '                                pd_idpresupuesto, pd_vigenciades' +
        'de,'
      '                                -1, DECODE (pd_idpresupuesto,'
      
        '                                            NULL, pd_vigenciades' +
        'de,'
      '                                            NULL'
      '                                           ),'
      '                                NULL'
      '                               ),'
      '                        (SELECT es_fechabaja'
      '                           FROM art.aes_estudios aes2'
      
        '                          WHERE aes2.es_codigo = aes.es_codigo) ' +
        'es_fechabaja,'
      '                        es_id AS es_idestudio, es_sincosto'
      
        '                   FROM comunes.cpd_prestadorestudio, art.aes_es' +
        'tudios aes'
      '                  WHERE pd_idprestador = :idprestador'
      '                    AND pd_vigenciahasta IS NULL'
      '                    AND pd_fechabaja IS NULL'
      '                    AND es_codigo = pd_idestudio) estudios'
      '          WHERE rs_periodicidad <='
      '                   DECODE'
      '                      ((SELECT NVL'
      '                                  (sp_operativo,'
      '                                   art.amp.get_operativoproxlote'
      
        '                                                               (' +
        'rs_idestableci)'
      '                                  )'
      '                          FROM comunes.csp_solicitudpresupuesto'
      '                         WHERE sp_contrato = rs_contrato'
      
        '                           AND sp_idestablecimiento = rs_idestab' +
        'leci'
      '                           AND sp_id ='
      '                                  (SELECT MAX (sp_id)'
      
        '                                     FROM comunes.csp_solicitudp' +
        'resupuesto'
      
        '                                    WHERE sp_contrato = rs_contr' +
        'ato'
      '                                      AND sp_idestablecimiento ='
      
        '                                                                ' +
        'rs_idestableci)),'
      '                       '#39'S'#39', 6,'
      '                       '#39'A'#39', 24,'
      '                       '#39'R'#39', -1,'
      '                       24'
      '                      )'
      '            AND rs_estableci = ur_estableci'
      '            AND rs_cuit = ur_cuit'
      '            AND rs_fecha = ur_fecharelev'
      '            AND ur_cuit = :cuitestablecim'
      '            AND ur_estableci = :nroestablecim'
      '            AND es_idestudio = rs_idestudio'
      '            AND pd_idpresupuesto = :idpresupuesto'
      '            AND estudios.es_sincosto = '#39'N'#39
      'UNION ALL'
      
        'SELECT   TO_CHAR (:idprestador) ca_identificador, estudios.es_co' +
        'digo,'
      
        '         TO_NUMBER (DECODE (:idpresupuesto, -1, NULL, 0, NULL, :' +
        'idpresupuesto)'
      '                   ) pd_idpresupuesto,'
      
        '         UPPER (estudios.es_descripcion) es_descripcion, 1 pd_id' +
        'tipovalor,'
      
        '         NULL pd_valor, NULL pd_vigenciadesde, estudios.es_fecha' +
        'baja,'
      
        '         estudios.es_id es_idestudio, estudios.es_sincosto, null' +
        ' pd_vigenciahasta'
      '    FROM comunes.csp_solicitudpresupuesto,'
      '         afi.aes_establecimiento aes,'
      '         hys.hdl_detallelote hdl,'
      '         art.aes_estudios estudios,'
      '         hys.hre_reconfirmacionestudio hre,'
      '         hys.hgr_gestionreconfirmacion hgr'
      '   WHERE dl_id = gr_iddetallelote'
      '     AND sp_contrato = es_contrato'
      '     AND sp_idestablecimiento = dl_idestableci'
      '     AND sp_id = :idsolicitud'
      '     AND sp_operativo = '#39'R'#39
      '     AND NOT EXISTS ('
      '            SELECT 1'
      '              FROM comunes.cpd_prestadorestudio'
      '             WHERE pd_idprestador = :idprestador'
      '               AND pd_idestudio = es_codigo'
      '               AND pd_vigenciahasta IS NULL'
      '               AND pd_fechabaja IS NULL'
      '               AND pd_idpresupuesto = :idpresupuesto)'
      '     AND aes.es_id = dl_idestableci'
      '     AND dl_idestableci = :idestablecim'
      '     AND dl_id = gr_iddetallelote'
      '     AND es_codigo = re_idestudio'
      '     AND re_fechabaja IS NULL'
      '     AND re_idreconfirmacion = gr_id'
      '     AND gr_enfprofesional = '#39'N'#39
      '     AND gr_fechabaja IS NULL'
      'UNION ALL'
      'SELECT   TO_CHAR (pd_idprestador), estudios.es_codigo,'
      '         TO_NUMBER (DECODE (:idpresupuesto,'
      '                            -1, DECODE (pd_idpresupuesto,'
      '                                        NULL, NULL,'
      '                                        :idpresupuesto'
      '                                       ),'
      '                            0, NULL,'
      '                            pd_idpresupuesto, :idpresupuesto'
      '                           )'
      '                   ),'
      
        '         UPPER (estudios.es_descripcion) es_descripcion, pd_idti' +
        'povalor,'
      '         DECODE (:idpresupuesto,'
      '                 0, NULL,'
      '                 pd_idpresupuesto, pd_valor,'
      
        '                 -1, DECODE (pd_idpresupuesto, NULL, pd_valor, N' +
        'ULL),'
      '                 NULL'
      '                ),'
      '         DECODE (:idpresupuesto,'
      '                 0, NULL,'
      '                 pd_idpresupuesto, pd_vigenciadesde,'
      
        '                 -1, DECODE (pd_idpresupuesto, NULL, pd_vigencia' +
        'desde, NULL),'
      '                 NULL'
      '                ),'
      '         (SELECT aes2.es_fechabaja'
      '            FROM art.aes_estudios aes2'
      
        '           WHERE aes2.es_codigo = estudios.es_codigo) es_fechaba' +
        'ja,'
      
        '         estudios.es_id es_idestudio, es_sincosto, null pd_vigen' +
        'ciahasta'
      '    FROM comunes.cpd_prestadorestudio,'
      '         comunes.csp_solicitudpresupuesto,'
      '         afi.aes_establecimiento aes,'
      '         hys.hdl_detallelote hdl,'
      '         art.aes_estudios estudios,'
      '         hys.hre_reconfirmacionestudio hre,'
      '         hys.hgr_gestionreconfirmacion hgr'
      '   WHERE dl_id = gr_iddetallelote'
      '     AND sp_contrato = es_contrato'
      '     AND sp_idestablecimiento = dl_idestableci'
      '     AND sp_id = :idsolicitud'
      '     AND sp_operativo = '#39'R'#39
      '     AND pd_idprestador = :idprestador'
      '     AND pd_idestudio = es_codigo'
      '     AND pd_vigenciahasta IS NULL'
      '     AND pd_fechabaja IS NULL'
      '     AND pd_idpresupuesto = :idpresupuesto'
      '     AND aes.es_id = dl_idestableci'
      '     AND dl_idestableci = :idestablecim'
      '     AND dl_id = gr_iddetallelote'
      '     AND es_codigo = re_idestudio'
      '     AND re_fechabaja IS NULL'
      '     AND re_idreconfirmacion = gr_id'
      '     AND gr_enfprofesional = '#39'N'#39
      '     AND gr_fechabaja IS NULL'
      'UNION ALL'
      ''
      'SELECT   TO_CHAR (ca_identificador), NULL es_codigo,'
      
        '         TO_NUMBER (pd_idpresupuesto), UPPER (tv_descripcion) es' +
        '_descripcion,'
      '         pd_idtipovalor, TO_CHAR (pd_valor),'
      
        '         TO_CHAR (NVL2 (pp_id, pp_vigenciadesde, pd_vigenciadesd' +
        'e)'
      '                 ) pd_vigenciadesde,'
      
        '         NULL es_fechabaja, NULL es_idestudio, NULL es_sincosto,' +
        ' null pd_vigenciahasta'
      '    FROM comunes.cpp_presupuestoprestador,'
      '         comunes.cpd_prestadorestudio,'
      '         art.cpr_prestador cpr,'
      '         comunes.ctv_tipovalor tv'
      '   WHERE pp_id = :idpresupuesto'
      '     AND pd_vigenciahasta IS NULL'
      '     AND pd_fechabaja IS NULL'
      '     AND pd_idprestador = :idprestador'
      '     AND pd_idpresupuesto = pp_id(+)'
      '     AND pd_idtipovalor <> 1'
      '     AND ca_identificador = pd_idprestador'
      '     AND tv.tv_id = pd_idtipovalor'
      'ORDER BY pd_idtipovalor, es_codigo'
      '')
    Left = 937
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuitestablecim'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nroestablecim'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsolicitud'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idestablecim'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsolicitud'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idestablecim'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idprestador'
        ParamType = ptInput
      end>
  end
  object dsPresupDetalle: TDataSource
    DataSet = sdqPresupDetalle
    Left = 965
    Top = 480
  end
  object sdqReplicar: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT vp_id, vp_nomenclador, vp_capitulo, vp_codigo, vp_vigenci' +
        'adesde, vp_multiplicador, vp_honinternados,'
      
        '       vp_honambulatorios, vp_gastointernados, vp_gastoambulator' +
        'ios, vp_valor, vp_multigastos, vp_sesiones,'
      
        '       vp_antitetanica, vp_hiv, vp_anestesia, vp_psicologica, ca' +
        '_identificador, vp_idnomenclador, '
      
        '       vp_valorhonorarios, vp_valorgastos, vp_default, vp_abona_' +
        'retorno, vp_suma_fija, vp_monto_minimo, on_descripcion,'
      
        '       vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_findesema' +
        'na'
      
        '  FROM art.svp_valorprestador, art.cpr_prestador, art.son_nomenc' +
        'lador'
      ' WHERE vp_prestador = ca_identificador'
      '   AND ca_clave = :cuit'
      
        '   AND ca_cargavalores = '#39'S'#39'                                    ' +
        '    '
      '   AND vp_vigenciahasta IS NULL'
      '   AND vp_nomenclador = on_nomenclador'
      '   AND vp_capitulo = on_capitulo '
      '   AND vp_codigo = on_codigo'
      '   AND on_usubaja IS NULL'
      '   AND vp_fechabaja IS NULL')
    Left = 250
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'cuit'
        ParamType = ptInput
      end>
    object sdqReplicarVP_NOMENCLADOR: TStringField
      FieldName = 'VP_NOMENCLADOR'
      Size = 1
    end
    object sdqReplicarVP_CAPITULO: TStringField
      FieldName = 'VP_CAPITULO'
      Size = 2
    end
    object sdqReplicarVP_CODIGO: TStringField
      FieldName = 'VP_CODIGO'
      Size = 15
    end
    object sdqReplicarVP_VIGENCIADESDE: TDateTimeField
      FieldName = 'VP_VIGENCIADESDE'
    end
    object sdqReplicarVP_MULTIPLICADOR: TFloatField
      FieldName = 'VP_MULTIPLICADOR'
    end
    object sdqReplicarVP_HONINTERNADOS: TFloatField
      FieldName = 'VP_HONINTERNADOS'
    end
    object sdqReplicarVP_HONAMBULATORIOS: TFloatField
      FieldName = 'VP_HONAMBULATORIOS'
    end
    object sdqReplicarVP_GASTOINTERNADOS: TFloatField
      FieldName = 'VP_GASTOINTERNADOS'
    end
    object sdqReplicarVP_GASTOAMBULATORIOS: TFloatField
      FieldName = 'VP_GASTOAMBULATORIOS'
    end
    object sdqReplicarVP_VALOR: TFloatField
      FieldName = 'VP_VALOR'
    end
    object sdqReplicarVP_MULTIGASTOS: TFloatField
      FieldName = 'VP_MULTIGASTOS'
    end
    object sdqReplicarVP_SESIONES: TFloatField
      FieldName = 'VP_SESIONES'
    end
    object sdqReplicarVP_ANTITETANICA: TStringField
      FieldName = 'VP_ANTITETANICA'
      Size = 1
    end
    object sdqReplicarVP_HIV: TStringField
      FieldName = 'VP_HIV'
      Size = 1
    end
    object sdqReplicarVP_ANESTESIA: TStringField
      FieldName = 'VP_ANESTESIA'
      Size = 1
    end
    object sdqReplicarVP_PSICOLOGICA: TStringField
      FieldName = 'VP_PSICOLOGICA'
      Size = 1
    end
    object sdqReplicarCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqReplicarVP_IDNOMENCLADOR: TFloatField
      FieldName = 'VP_IDNOMENCLADOR'
    end
    object sdqReplicarVP_VALORHONORARIOS: TFloatField
      FieldName = 'VP_VALORHONORARIOS'
    end
    object sdqReplicarVP_VALORGASTOS: TFloatField
      FieldName = 'VP_VALORGASTOS'
    end
    object sdqReplicarVP_DEFAULT: TStringField
      FieldName = 'VP_DEFAULT'
      Size = 1
    end
    object sdqReplicarVP_ABONA_RETORNO: TStringField
      FieldName = 'VP_ABONA_RETORNO'
      Size = 1
    end
    object sdqReplicarVP_SUMA_FIJA: TFloatField
      FieldName = 'VP_SUMA_FIJA'
    end
    object sdqReplicarVP_MONTO_MINIMO: TFloatField
      FieldName = 'VP_MONTO_MINIMO'
    end
    object sdqReplicarvp_id: TFloatField
      FieldName = 'vp_id'
    end
    object sdqReplicaron_descripcion: TStringField
      FieldName = 'on_descripcion'
      Size = 200
    end
    object sdqReplicarVP_VIAJE_EXCLUSIVO: TFloatField
      FieldName = 'VP_VIAJE_EXCLUSIVO'
    end
    object sdqReplicarVP_VIAJE_NOCTURNO: TFloatField
      FieldName = 'VP_VIAJE_NOCTURNO'
    end
    object sdqReplicarVP_VIAJE_FINDESEMANA: TFloatField
      FieldName = 'VP_VIAJE_FINDESEMANA'
    end
  end
  object dsReplicar: TDataSource
    DataSet = sdqReplicar
    Left = 278
    Top = 264
  end
  object sdqBaseRemis: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqBaseRemisAfterOpen
    SQL.Strings = (
      'SELECT br_id,'
      '       br_idprestador,'
      '       br_calle,'
      '       br_numero,'
      '       br_piso,'
      '       br_departamento,'
      '       br_cpostal,'
      '       br_cpostala,'
      '       br_localidad,'
      '       br_provincia,'
      '       br_lat,'
      '       br_lng,'
      '       br_usualta,'
      '       br_fechaalta,'
      '       br_usumodif,'
      '       br_fechamodif,'
      '       br_usubaja,'
      '       br_fechabaja,'
      '       pv_descripcion'
      '  FROM art.cpv_provincias, amed.mbr_baseremis'
      ' WHERE br_idprestador = :idprestador'
      '   AND br_provincia = pv_codigo')
    Left = 288
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end>
    object sdqBaseRemisBR_ID: TFloatField
      FieldName = 'BR_ID'
      Required = True
    end
    object sdqBaseRemisBR_IDPRESTADOR: TFloatField
      FieldName = 'BR_IDPRESTADOR'
      Required = True
    end
    object sdqBaseRemisBR_CALLE: TStringField
      DisplayLabel = 'Calle'
      FieldName = 'BR_CALLE'
      Size = 60
    end
    object sdqBaseRemisBR_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'BR_NUMERO'
    end
    object sdqBaseRemisBR_PISO: TStringField
      FieldName = 'BR_PISO'
    end
    object sdqBaseRemisBR_DEPARTAMENTO: TStringField
      FieldName = 'BR_DEPARTAMENTO'
    end
    object sdqBaseRemisBR_CPOSTAL: TStringField
      FieldName = 'BR_CPOSTAL'
      Size = 5
    end
    object sdqBaseRemisBR_CPOSTALA: TStringField
      FieldName = 'BR_CPOSTALA'
      Size = 8
    end
    object sdqBaseRemisBR_LOCALIDAD: TStringField
      DisplayLabel = 'Localidad'
      FieldName = 'BR_LOCALIDAD'
      Size = 60
    end
    object sdqBaseRemisBR_PROVINCIA: TStringField
      FieldName = 'BR_PROVINCIA'
      Size = 2
    end
    object sdqBaseRemisBR_LAT: TFloatField
      DisplayLabel = 'Latitud'
      FieldName = 'BR_LAT'
    end
    object sdqBaseRemisBR_LNG: TFloatField
      DisplayLabel = 'Longitud'
      FieldName = 'BR_LNG'
    end
    object sdqBaseRemisBR_USUALTA: TStringField
      FieldName = 'BR_USUALTA'
      Required = True
    end
    object sdqBaseRemisBR_FECHAALTA: TDateTimeField
      FieldName = 'BR_FECHAALTA'
      Required = True
    end
    object sdqBaseRemisBR_USUMODIF: TStringField
      FieldName = 'BR_USUMODIF'
    end
    object sdqBaseRemisBR_FECHAMODIF: TDateTimeField
      FieldName = 'BR_FECHAMODIF'
    end
    object sdqBaseRemisBR_USUBAJA: TStringField
      FieldName = 'BR_USUBAJA'
    end
    object sdqBaseRemisBR_FECHABAJA: TDateTimeField
      FieldName = 'BR_FECHABAJA'
    end
    object sdqBaseRemisPV_DESCRIPCION: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
  end
  object dsBaseRemis: TDataSource
    DataSet = sdqBaseRemis
    Left = 316
    Top = 316
  end
  object sdBaseRemis: TSortDialog
    Caption = 'Orden'
    DataSet = sdqBaseRemis
    SortFields = <>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 400
    Top = 316
  end
  object edlgBaseRemis: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqBaseRemis
    Fields = <>
    OutputFile = 'BaseRemis.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 372
    Top = 316
  end
  object qpBaseRemis: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsBaseRemis
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Bases de la Remiser'#237'a'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 344
    Top = 316
  end
  object pmuFiltrarDatosMed: TPopupMenu
    Left = 14
    Top = 289
    object mnuVisualizarValoresAlta_DatosMed: TMenuItem
      Caption = 'Visualizar s'#243'lo valores de alta'
      Checked = True
      OnClick = mnuVisualizarValoresAlta_DatosMedClick
    end
    object mnuVisualizarTodosValores_DatosMed: TMenuItem
      Caption = 'Visualizar todos los valores'
      OnClick = mnuVisualizarTodosValores_DatosMedClick
    end
  end
  object pmReplicarVM: TPopupMenu
    Left = 15
    Top = 233
    object mnuRepVMSelecTodo: TMenuItem
      Caption = 'Seleccionar todo'
      OnClick = mnuRepVMSelecTodoClick
    end
  end
  object sdqReplicarUM: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT up_unidad, up_vigenciadesde, up_vigenciahasta, up_valor, '
      '               um_descripcion, up_id'
      
        '            FROM sup_unidadprestador, cpr_prestador, sum_unidade' +
        'smedicas'
      '          WHERE up_prestador = ca_identificador'
      '             AND up_unidad = um_codigo'
      '             AND ca_clave = :CUIT'
      '             AND ca_cargavalores = '#39'S'#39
      '             AND up_vigenciahasta IS NULL'
      '             AND up_fechabaja IS NULL')
    Left = 250
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end>
    object sdqReplicarUMup_unidad: TStringField
      FieldName = 'up_unidad'
    end
    object sdqReplicarUMum_descripcion: TStringField
      FieldName = 'um_descripcion'
    end
    object sdqReplicarUMup_valor: TFloatField
      FieldName = 'up_valor'
    end
    object sdqReplicarUMup_vigenciadesde: TDateTimeField
      FieldName = 'up_vigenciadesde'
    end
    object sdqReplicarUMup_vigenciahasta: TDateTimeField
      FieldName = 'up_vigenciahasta'
    end
    object sdqReplicarUMup_id: TFloatField
      FieldName = 'up_id'
    end
  end
  object dsReplicarUM: TDataSource
    DataSet = sdqReplicarUM
    Left = 278
    Top = 293
  end
  object pmReplicarUM: TPopupMenu
    Left = 15
    Top = 261
    object mnuRepUMSelecTodo: TMenuItem
      Caption = 'Seleccionar todo'
      OnClick = mnuRepUMSelecTodoClick
    end
  end
  object sdqSucursales: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT sp_id, sp_idprestador, sp_nombre, sp_calle, sp_numero, sp' +
        '_piso,'
      
        '       sp_departamento, sp_codpostal, sp_codpostala, sp_localida' +
        'd,'
      
        '       sp_provincia, sp_telefono, sp_contacto, sp_mail, sp_fecha' +
        'baja,'
      
        '       pv_descripcion, art.utiles.armar_domicilio(sp_calle, sp_n' +
        'umero, sp_piso, sp_departamento) || '#39' '#39' ||'
      
        '       art.utiles.armar_localidad2(sp_codpostal, sp_codpostala, ' +
        'sp_localidad, sp_provincia) direccion'
      '  FROM SIN.ssp_sucursalesprestador, cpv_provincias'
      ' WHERE pv_codigo = sp_provincia'
      '       AND sp_idprestador = :idprest   '
      '       AND sp_fechabaja IS NULL   ')
    Left = 937
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idprest'
        ParamType = ptInput
      end>
  end
  object dsSucursales: TDataSource
    DataSet = sdqSucursales
    Left = 965
    Top = 424
  end
  object edSucursales: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqSucursales
    Fields = <>
    OutputFile = 'Sucursales.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    VersionExcel = msExcel97
    Left = 1025
    Top = 424
  end
  object qpSucursales: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsSucursales
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Prestadores Siniestros'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 1053
    Top = 424
  end
  object sdSucursales: TSortDialog
    Caption = 'Orden'
    DataSet = sdqSucursales
    SortFields = <
      item
        Title = 'Sucursal'
        DataField = 'sp_nombre'
        FieldIndex = 0
      end
      item
        Title = 'Direcci'#243'n'
        DataField = 'direccion'
        FieldIndex = 0
      end
      item
        Title = 'Contacto'
        DataField = 'sp_contacto'
        FieldIndex = 0
      end
      item
        Title = 'e-mail'
        DataField = 'sp_mail'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 997
    Top = 424
  end
  object pmuFiltrarContratos: TPopupMenu
    Left = 16
    Top = 192
    object mnuRenAuto: TMenuItem
      Caption = 'Renov. Autom'#225'tica'
      Checked = True
      OnClick = mnuRenAutoClick
    end
    object mnuTodosContratos: TMenuItem
      Caption = 'Todos los contratos'
      OnClick = mnuTodosContratosClick
    end
  end
  object cdsValoresPrestaciones: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'es_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'es_descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'pd_valor'
        DataType = ftFloat
      end
      item
        Name = 'pd_vigenciadesde'
        DataType = ftDate
      end
      item
        Name = 'es_fechabaja'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'es_descripcion'
        Fields = 'es_descripcion'
      end
      item
        Name = 'es_codigo'
        Fields = 'es_codigo'
      end>
    IndexFieldNames = 'es_descripcion'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsValoresPrestacionesAfterScroll
    Left = 836
    Top = 416
    Data = {
      9A0000009619E0BD0100000018000000050000000000030000009A000965735F
      636F6469676F01004900000001000557494454480200020014000E65735F6465
      736372697063696F6E0100490000000100055749445448020002006400087064
      5F76616C6F7208000400000000001070645F766967656E636961646573646504
      000600000000000C65735F666563686162616A6108000800000000000000}
    object cdsValoresPrestacioneses_codigo: TStringField
      FieldName = 'es_codigo'
    end
    object cdsValoresPrestacioneses_descripcion: TStringField
      DisplayWidth = 100
      FieldName = 'es_descripcion'
      Size = 100
    end
    object cdsValoresPrestacionespd_valor: TFloatField
      FieldName = 'pd_valor'
    end
    object cdsValoresPrestacionespd_vigenciadesde: TDateField
      FieldName = 'pd_vigenciadesde'
    end
    object cdsValoresPrestacioneses_fechabaja: TDateTimeField
      FieldName = 'es_fechabaja'
    end
  end
end
