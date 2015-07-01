inherited frmCIIUDescuentoPrimeraCuota: TfrmCIIUDescuentoPrimeraCuota
  Left = 276
  Top = 100
  Width = 638
  Height = 615
  Caption = 'Mantenimiento | CIIU Descuento Primera Cuota(Gerencia Comercial)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 630
  end
  inherited CoolBar: TCoolBar
    Width = 630
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 626
      end>
    inherited ToolBar: TToolBar
      Width = 613
      inherited ToolButton11: TToolButton
        Width = 10
      end
      inherited tbSalir: TToolButton
        Left = 349
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 630
    Height = 514
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'AB_ID'
        Title.Caption = 'C'#243'digo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IDENT'
        Title.Caption = 'C'#243'digo Entidad'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CUIT'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n de la Actividad'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_FECHADESDE'
        Title.Caption = 'Vig. Desde'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_FECHAHASTA'
        Title.Caption = 'Hasta'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AB_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 75
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 156
    Width = 317
    Height = 237
    OnBeforeShow = fpAbmBeforeShow
    OnShow = fpAbmShow
    ActiveControl = fraCAC_ACTIVIDAD.edCodigo
    inherited BevelAbm: TBevel
      Top = 185
      Width = 304
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 52
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object lbEntidad: TLabel [2]
      Left = 12
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    inherited btnAceptar: TButton
      Left = 152
      Top = 199
      Width = 72
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 232
      Top = 199
      Width = 72
      TabOrder = 4
    end
    inline fraCAC_ACTIVIDAD: TfraStaticActividad
      Left = 10
      Top = 67
      Width = 298
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TComboGrid
        Width = 235
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraXEN_ENTIDAD: TfraEntidades
      Left = 10
      Top = 28
      Width = 299
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 234
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 104
      Width = 301
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vigencia'
      TabOrder = 2
      DesignSize = (
        301
        61)
      object lbDesde: TLabel
        Left = 12
        Top = 28
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object lbHasta: TLabel
        Left = 164
        Top = 28
        Width = 28
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Hasta'
      end
      object dDesde: TDateTimePicker
        Left = 56
        Top = 24
        Width = 89
        Height = 21
        Date = 40646.593432800920000000
        Time = 40646.593432800920000000
        TabOrder = 0
        OnChange = dDesdeChange
      end
      object dHasta: TDateTimePicker
        Left = 204
        Top = 24
        Width = 89
        Height = 21
        Anchors = [akTop, akRight]
        Date = 40646.593671018520000000
        Time = 40646.593671018520000000
        TabOrder = 1
        OnChange = dHastaChange
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
