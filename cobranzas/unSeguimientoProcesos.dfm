inherited frmSeguimientoProcesos: TfrmSeguimientoProcesos
  Left = 199
  Top = 106
  Width = 755
  Height = 400
  Caption = 'Seguimiento de Procesos'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 755
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 747
    Height = 50
    object gbFechaAlta: TGroupBox
      Left = 3
      Top = 2
      Width = 208
      Height = 43
      Caption = 'Fecha de Inicio / Fin'
      TabOrder = 0
      object Label5: TLabel
        Left = 99
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaInicioDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edFechaInicioHasta
        TabOrder = 0
      end
      object edFechaInicioHasta: TDateComboBox
        Left = 115
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edFechaInicioDesde
        TabOrder = 1
      end
    end
    object chkProcesosNoFinalizados: TCheckBox
      Left = 606
      Top = 28
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = '&Procesos no Finalizados'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkAutoRefrescar: TCheckBox
      Left = 650
      Top = 8
      Width = 93
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = '&Auto Refrescar'
      TabOrder = 2
      OnClick = chkAutoRefrescarClick
    end
    object gbProceso: TGroupBox
      Left = 215
      Top = 2
      Width = 386
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Proceso'
      TabOrder = 1
      DesignSize = (
        386
        43)
      object edProceso: TEdit
        Left = 7
        Top = 15
        Width = 371
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 50
    Width = 747
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 743
      end>
    inherited ToolBar: TToolBar
      Width = 730
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 79
    Width = 747
    Height = 294
    Columns = <
      item
        Expanded = False
        FieldName = 'TC_PROCESO'
        Title.Caption = 'Proceso'
        Width = 216
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FINICIO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Inicio'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_CHECKPOINT'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Reg. Procesado'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Proceso Ult. Reg.'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_REGISTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Reg. Procesados'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FFIN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Fin Proceso'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGXMINUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Regs./min.'
        Width = 69
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TC_PROCESO, TC_REGISTROS, TC_CHECKPOINT,'
      '       TO_CHAR(TC_FECHAINICIO, '#39'DD/MM/YYYY HH24:MI:SS'#39') FINICIO,'
      
        '       TO_CHAR(TC_FECHAPROCESO, '#39'DD/MM/YYYY HH24:MI:SS'#39') FPROCES' +
        'O,'
      '       TO_CHAR(TC_FECHAFIN, '#39'DD/MM/YYYY HH24:MI:SS'#39') FFIN,'
      
        '       ROUND(TC_REGISTROS/(NVL(TC_FECHAFIN, SYSDATE)-TC_FECHAINI' +
        'CIO)*24*60, 2) REGXMINUTO'
      'FROM ART.CTC_TABLACONTROL'
      ' '
      ' ')
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
  object tmrAutoRefrescar: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrAutoRefrescarTimer
    Left = 124
    Top = 201
  end
end
