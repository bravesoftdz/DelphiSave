inherited frmConsVisitasRealizadas: TfrmConsVisitasRealizadas
  Left = 204
  Top = 167
  Width = 667
  Height = 472
  Caption = 'Visitas Realizadas'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 659
    Height = 4
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 4
    Width = 659
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 655
      end>
    inherited ToolBar: TToolBar
      Width = 642
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
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
    Top = 33
    Width = 659
    Height = 373
    Hint = 'Hacer doble click para seleccionar la visita'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rv_fecha'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rv_estableci'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Preventor'
        Width = 206
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rv_horariodesde'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Desde'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rv_horariohasta'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Hasta'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rv_duracionpermanencia'
        Title.Alignment = taCenter
        Title.Caption = 'Permanencia'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rv_operativo'
        Title.Alignment = taCenter
        Title.Caption = 'Operativo'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rv_tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Empresa'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rv_fechaviaticos'
        Title.Caption = 'F.Entrega de Vi'#225'ticos'
        Width = 108
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 406
    Width = 659
    Height = 39
    Align = alBottom
    TabOrder = 3
    object btnSeleccionar: TButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Seleccionar'
      Default = True
      TabOrder = 0
      OnClick = btnSeleccionarClick
    end
    object btnCancelar: TButton
      Left = 576
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
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
