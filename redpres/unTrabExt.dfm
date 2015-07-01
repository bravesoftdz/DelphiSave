inherited frmTrabExt: TfrmTrabExt
  Left = 204
  Top = 106
  Width = 716
  Height = 470
  Caption = 'Trabajadores que viajan al exterior'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 708
    Height = 114
    object Label1: TLabel
      Left = 10
      Top = 93
      Width = 23
      Height = 13
      Caption = 'Viaje'
    end
    object Label2: TLabel
      Left = 135
      Top = 93
      Width = 41
      Height = 13
      Caption = 'N'#186' Solic.'
    end
    object ChkEmpresa: TCheckPanel
      Left = 3
      Top = 0
      Width = 702
      Height = 41
      Caption = '&Empresa'
      TabOrder = 0
      Checked = False
      OnChange = ChkEmpresaChange
      inline Empresa: TfraEmpresa
        Left = 5
        Top = 15
        Width = 690
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 586
        end
        inherited edContrato: TIntEdit
          Left = 631
        end
        inherited cmbRSocial: TArtComboBox
          Width = 454
        end
      end
    end
    object Chktrabajador: TCheckPanel
      Left = 3
      Top = 41
      Width = 702
      Height = 42
      Caption = '&Trabajador'
      TabOrder = 1
      Checked = False
      OnChange = ChktrabajadorChange
      DesignSize = (
        702
        42)
      inline TrabajadorSin: TfraTrabajador
        Left = 3
        Top = 14
        Width = 691
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbNombre: TArtComboBox
          Width = 609
        end
      end
    end
    object edSolic: TEdit
      Left = 177
      Top = 89
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object CmbViaje: TComboBox
      Left = 45
      Top = 89
      Width = 82
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'No iniciado'
        'En curso'
        'Terminado'
        'Todos')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 114
    Width = 708
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 704
      end>
    inherited ToolBar: TToolBar
      Width = 691
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 21
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 19
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 143
    Width = 708
    Height = 300
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Nro. de solicitud'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Trabajador'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Inicio'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Final'
        Title.Caption = 'F.Finaliza'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CX_FORMAVIAJE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Forma de viaje'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Destino'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Asis. Viajero'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Width = 200
        Visible = True
      end>
  end
  object FPABM: TFormPanel [3]
    Left = 115
    Top = 171
    Width = 543
    Height = 210
    FormWidth = 0
    FormHeigth = 0
    Constraints.MinHeight = 210
    Constraints.MinWidth = 438
    DesignSize = (
      543
      210)
    object Label3: TLabel
      Left = 5
      Top = 28
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object Label4: TLabel
      Left = 4
      Top = 51
      Width = 68
      Height = 13
      Caption = 'Fec. de Salida'
    end
    object Label5: TLabel
      Left = 5
      Top = 74
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object Label6: TLabel
      Left = 5
      Top = 97
      Width = 70
      Height = 13
      Caption = 'Asist. al viajero'
    end
    object Label7: TLabel
      Left = 6
      Top = 119
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label8: TLabel
      Left = 4
      Top = 187
      Width = 74
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Fec. de Recep.'
    end
    object Label9: TLabel
      Left = 169
      Top = 51
      Width = 79
      Height = 13
      Caption = 'Fec. de Regreso'
    end
    object Label10: TLabel
      Left = 5
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline EmpresaABM: TfraEmpresa
      Left = 76
      Top = 3
      Width = 463
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
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 361
      end
      inherited mskCUIT: TMaskEdit
        Left = 2
      end
      inherited edContrato: TIntEdit
        Left = 404
      end
      inherited cmbRSocial: TArtComboBox
        Left = 132
        Width = 223
      end
    end
    object FSalida: TDateComboBox
      Left = 78
      Top = 48
      Width = 88
      Height = 21
      MaxDateCombo = Fregreso
      TabOrder = 2
    end
    object Fregreso: TDateComboBox
      Left = 250
      Top = 48
      Width = 88
      Height = 21
      MinDateCombo = FSalida
      TabOrder = 3
    end
    object RgFViaje: TRadioGroup
      Left = 445
      Top = 46
      Width = 93
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Forma de Viaje'
      ItemIndex = 0
      Items.Strings = (
        'A'#233'&reo'
        '&Mar'#237'timo'
        '&Terrestre')
      TabOrder = 4
    end
    object FRecep: TDateComboBox
      Left = 78
      Top = 183
      Width = 88
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 8
    end
    object EdObs: TMemo
      Left = 78
      Top = 118
      Width = 461
      Height = 62
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 7
      OnExit = EdObsExit
    end
    object edDestino: TEdit
      Left = 78
      Top = 71
      Width = 365
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 5
    end
    object EdAsist: TEdit
      Left = 77
      Top = 94
      Width = 366
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 6
    end
    object CmdAceptar: TButton
      Left = 386
      Top = 184
      Width = 75
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 9
      OnClick = CmdAceptarClick
    end
    object cmdCancelar: TButton
      Left = 463
      Top = 184
      Width = 75
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 10
    end
    inline fraTrabajadorSINABM: TfraTrabajadorSIN
      Left = 78
      Top = 25
      Width = 462
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbTrabCUIL: TLabel
        Left = 11
      end
      inherited lbTrabNombre: TLabel
        Left = 84
      end
      inherited mskTrabCUIL: TMaskEdit
        Left = 0
        Width = 79
        EditMask = '99-99999999-9;0;'
        OnKeyPress = fraTrabajadorSINABMmskTrabCUILKeyPress
      end
      inherited dbcTrabNombre: TArtComboBox
        Left = 130
        Width = 330
        Columns = <
          item
            Expanded = False
            FieldName = 'TJ_CUIL'
            Title.Caption = 'CUIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TJ_NOMBRE'
            Title.Caption = 'Apellido y Nombre'
            Width = 220
            Visible = True
          end>
        OnCloseUp = fraTrabajadorSINABMdbcTrabNombreCloseUp
        OnDropDown = fraTrabajadorSINABMdbcTrabNombreDropDown
      end
      inherited sdqTrabajador: TSDQuery
        Left = 276
        Top = 65528
      end
      inherited dsTrabajador: TDataSource
        Left = 304
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT tv_id "Nro. de solicitud", mp_nombre "Empresa", tj_Nombre' +
        ' "Trabajador", tv_fechasalida "F.Inicio", tv_fecharegreso "F.Fin' +
        'al", '
      
        'cx_formaviaje, DECODE(cx_formaviaje,'#39'A'#39','#39'A'#233'reo'#39','#39'M'#39','#39'Maritimo'#39','#39 +
        'T'#39','#39'Terrestre'#39') "Forma de viaje", tv_destino "Destino", tv_asist' +
        'enciaviajero "Asis. Viajero",'
      'tv_observaciones "Observaciones"'
      'FROM cmp_empresas,ctj_trabajadores,mtv_trabajadorenviaje'
      'WHERE mp_cuit=tv_cuit'
      'AND tj_cuil=tv_cuil ')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro. de solicitud'
        DataField = 'TV_ID'
        FieldIndex = 0
      end
      item
        Title = 'Empresa'
        DataField = 'mp_nombre'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'tj_nombre'
        FieldIndex = 0
      end
      item
        Title = 'F.Inicio'
        DataField = 'TV_FECHASALIDA'
        FieldIndex = 0
      end
      item
        Title = 'F.Final'
        DataField = 'TV_FECHAREGRESO'
        FieldIndex = 0
      end
      item
        Title = 'Forma de viaje'
        DataField = 'CX_FORMAVIAJE'
        FieldIndex = 0
      end
      item
        Title = 'Destino'
        DataField = 'TV_DESTINO'
        FieldIndex = 0
      end
      item
        Title = 'Asis. Viajero'
        DataField = 'TV_ASISTENCIAVIAJERO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'TV_OBSERVACIONES'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'Nro. de solicitud'
        Title = 'Nro. de solicitud'
      end
      item
        DataField = 'Empresa'
        Title = 'Empresa'
      end
      item
        DataField = 'Trabajador'
        Title = 'Trabajador'
      end
      item
        DataField = 'F.Inicio'
        Title = 'F.Inicio'
      end
      item
        DataField = 'F.Final'
        Title = 'F.Final'
      end
      item
        DataField = 'Forma de viaje'
        Title = 'Forma de viaje'
      end
      item
        DataField = 'Destino'
        Title = 'Destino'
      end
      item
        DataField = 'Asis. Viajero'
        Title = 'Asis. Viajero'
      end
      item
        DataField = 'Observaciones'
        Title = 'Observaciones'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'N'#186' de Solic.'
        DataField = 'Nro. de solicitud'
        MaxLength = 12
      end
      item
        Title = 'Empresa'
        DataField = 'Empresa'
        MaxLength = 25
      end
      item
        Title = 'Trabajador'
        DataField = 'Trabajador'
        MaxLength = 25
      end
      item
        Title = 'F.Inicio'
        DataField = 'F.Inicio'
        MaxLength = 12
      end
      item
        Title = 'F.Final'
        DataField = 'F.Final'
        MaxLength = 12
      end
      item
        Title = 'CX_FORMAVIAJE'
        DataField = 'CX_FORMAVIAJE'
        Visible = False
        MaxLength = 1
      end
      item
        Title = 'F.Viaje'
        DataField = 'Forma de viaje'
        MaxLength = 8
      end
      item
        Title = 'Destino'
        DataField = 'Destino'
        MaxLength = 30
      end
      item
        Title = 'Asis. Viajero'
        DataField = 'Asis. Viajero'
        MaxLength = 20
      end
      item
        Title = 'Observaciones'
        DataField = 'Observaciones'
        MaxLength = 50
      end>
    PageOrientation = pxLandscape
    OnGetCellParams = QueryPrintGetCellParams
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited FieldHider: TFieldHider
    SortDialog = nil
  end
end
