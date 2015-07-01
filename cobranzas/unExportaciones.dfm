inherited frmExportaciones: TfrmExportaciones
  Left = 202
  Top = 105
  Width = 747
  Height = 400
  Caption = 'Exportaciones'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 747
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 739
    Height = 48
    object gbFechaProceso: TGroupBox
      Left = 226
      Top = 1
      Width = 255
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Proceso'
      TabOrder = 1
      object Label2: TLabel
        Left = 5
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label3: TLabel
        Left = 130
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cmbFechaProcesoDesde: TDateComboBox
        Left = 40
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = cmbFechaProcesoHasta
        TabOrder = 0
      end
      object cmbFechaProcesoHasta: TDateComboBox
        Left = 162
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = cmbFechaProcesoDesde
        TabOrder = 1
      end
    end
    object gbFechaPresentacion: TGroupBox
      Left = 483
      Top = 1
      Width = 254
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Presentaci'#243'n'
      TabOrder = 2
      object Label4: TLabel
        Left = 5
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label5: TLabel
        Left = 130
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cmbFechaPresentDesde: TDateComboBox
        Left = 40
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = cmbFechaPresentHasta
        TabOrder = 0
      end
      object cmbFechaPresentHasta: TDateComboBox
        Left = 162
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = cmbFechaPresentDesde
        TabOrder = 1
      end
    end
    object gbProceso: TGroupBox
      Left = 2
      Top = 1
      Width = 222
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Proceso'
      TabOrder = 0
      DesignSize = (
        222
        43)
      inline fraStaticCTBProcesos: TfraStaticCTB_TABLAS
        Left = 5
        Top = 14
        Width = 214
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 150
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 739
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 735
      end>
    inherited ToolBar: TToolBar
      Width = 722
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 739
    Height = 296
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_PROCESO'
        Title.Caption = 'Proceso'
        Width = 192
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Proceso'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FEPRESENT'
        Title.Alignment = taCenter
        Title.Caption = 'F. Presentaci'#243'n'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_ARCHIVO'
        Title.Caption = 'Archivo'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_USUARIO'
        Title.Caption = 'Usuario'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_CANTREG'
        Title.Alignment = taCenter
        Title.Caption = 'Registros'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 58
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TRUNC(CE_FEPROCESO) FEPROCESO, CE_FEPRESENT, CE_ARCHIVO, ' +
        'CE_USUARIO,'
      '       CE_CANTREG, CE_PERIODO, TB_DESCRIPCION DESC_PROCESO'
      '  FROM CTB_TABLAS, CCE_CONTROLENVIOS'
      ' WHERE TB_CLAVE='#39'EXPOR'#39
      '   AND TB_CODIGO=CE_IDPROCESO'
      ''
      ' '
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcNone
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
end
