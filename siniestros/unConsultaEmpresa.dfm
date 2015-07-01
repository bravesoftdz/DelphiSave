inherited frmConsultaEmpresa: TfrmConsultaEmpresa
  Left = 226
  Top = 133
  Width = 688
  Height = 323
  Caption = 'Datos de la Empresa'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 680
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 680
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 676
      end>
    inherited ToolBar: TToolBar
      Width = 663
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ajustar el ancho de las columnas'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
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
    end
  end
  inherited Grid: TArtDBGrid
    Width = 422
    Height = 230
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIADESDE'
        Title.Caption = 'Vigencia desde'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_VIGENCIAHASTA'
        Title.Caption = 'Vigencia hasta'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo de baja'
        Width = 75
        Visible = True
      end>
  end
  inline fraInfoEmpresaExt: TfraInfoEmpresaExt [3]
    Left = 422
    Top = 66
    Width = 258
    Height = 230
    Align = alRight
    TabOrder = 3
    inherited lblAdic_1: TLabel
      Width = 125
    end
    inherited lblAdic_2: TLabel
      Width = 125
    end
    inherited lblAdic_4: TLabel
      Width = 125
    end
    inherited lblAdic_5: TLabel
      Width = 125
    end
    inherited lblAdic_6: TLabel
      Width = 125
    end
    inherited lblAdic_8: TLabel
      Width = 125
    end
    inherited lblAdic_7: TLabel
      Width = 125
    end
    inherited lblAdic_3: TLabel
      Width = 125
    end
    inherited lblAdic_0: TLabel
      Width = 125
    end
    inherited lblAdic_9: TLabel
      Width = 125
    end
    inherited lblAdic_10: TLabel
      Width = 125
    end
    inherited lblAdic_11: TLabel
      Width = 125
    end
    inherited lblAdic_12: TLabel
      Width = 125
    end
    inherited lblAdic_13: TLabel
      Width = 125
    end
  end
  inherited sdqConsulta: TSDQuery [4]
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT EM_CUIT, CO_CONTRATO, CO_VIGENCIADESDE, CO_VIGENCIAHASTA,'
      '       ESTADO.TB_DESCRIPCION ESTADO, CO_FECHABAJA,'
      '       MOTIVO.TB_DESCRIPCION MOTIVO'
      
        '  FROM CTB_TABLAS MOTIVO, CTB_TABLAS ESTADO, ACO_CONTRATO, AEM_E' +
        'MPRESA'
      ' WHERE CO_IDEMPRESA = EM_ID'
      '   AND CO_MOTIVOBAJA = MOTIVO.TB_CODIGO(+)'
      '   AND MOTIVO.TB_CLAVE(+) = '#39'MOTIB'#39
      '   AND CO_ESTADO = ESTADO.TB_CODIGO'
      '   AND ESTADO.TB_CLAVE = '#39'AFEST'#39
      '   AND EM_ID = :IdEmpresa')
    Left = 168
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdEmpresa'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource [5]
    Left = 196
    Top = 132
  end
  inherited SortDialog: TSortDialog [6]
    Left = 252
    Top = 104
  end
  inherited ExportDialog: TExportDialog [7]
    Left = 280
    Top = 104
  end
  inherited QueryPrint: TQueryPrint [8]
    Left = 280
    Top = 132
  end
  inherited Seguridad: TSeguridad [9]
    Left = 168
    Top = 104
  end
  inherited FormStorage: TFormStorage [10]
    Left = 196
    Top = 104
  end
  inherited PrintDialog: TPrintDialog [11]
    Left = 252
    Top = 132
  end
  inherited ShortCutControl: TShortCutControl [12]
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
    Left = 224
    Top = 104
  end
  inherited FieldHider: TFieldHider
    Left = 224
    Top = 132
  end
  object ShortCutControlChild: TShortCutControl
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
    Left = 224
    Top = 104
  end
end
