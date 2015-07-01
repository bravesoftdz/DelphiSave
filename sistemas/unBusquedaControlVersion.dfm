inherited frmBusquedaControlVersion: TfrmBusquedaControlVersion
  Left = 289
  Caption = 'B'#250'squeda en Control de Versi'#243'n'
  ClientHeight = 370
  ClientWidth = 607
  Constraints.MinHeight = 400
  Constraints.MinWidth = 615
  KeyPreview = True
  OldCreateOrder = True
  OnKeyUp = FSFormKeyUp
  ExplicitLeft = 289
  ExplicitWidth = 615
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 607
    Height = 112
    ExplicitWidth = 624
    ExplicitHeight = 112
    object Label1: TLabel
      Left = 4
      Top = 11
      Width = 48
      Height = 13
      Caption = 'B'#250'squeda'
    end
    object edBusqueda: TEdit
      Left = 58
      Top = 7
      Width = 431
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 32
      Width = 128
      Height = 80
      Caption = ' Extensi'#243'n '
      TabOrder = 2
      object checkExtension: TARTCheckListBox
        Left = 15
        Top = 16
        Width = 96
        Height = 57
        ItemHeight = 13
        Items.Strings = (
          '.DFM'
          '.DPR'
          '.PAS'
          '.DOF')
        TabOrder = 0
        AutoAjustarColumnas = True
        Locked = False
        Values.Strings = (
          '.DFM'
          '.DPR'
          '.PAS'
          '.DOF')
      end
    end
    object GroupBox2: TGroupBox
      Left = 144
      Top = 32
      Width = 456
      Height = 56
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Proyecto '
      TabOrder = 3
      DesignSize = (
        456
        56)
      inline fraProyecto: TfraStaticCodigoDescripcion
        Left = 10
        Top = 20
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 10
        ExplicitTop = 20
        ExplicitWidth = 432
        inherited cmbDescripcion: TComboGrid
          Width = 369
          ExplicitWidth = 369
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
    end
    object chkCaseSensitive: TCheckBox
      Left = 503
      Top = 8
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Case sensitive'
      TabOrder = 1
    end
    object chkSoloFuentesPropios: TCheckBox
      Left = 144
      Top = 91
      Width = 188
      Height = 17
      Caption = 'Solo Fuentes Desarrollo y Comunes'
      TabOrder = 4
    end
    object chkSoloProyectosDelphi: TCheckBox
      Left = 339
      Top = 91
      Width = 128
      Height = 17
      Caption = 'Solo Proyectos Delphi'
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 112
    Width = 607
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 601
      end>
    ExplicitTop = 112
    ExplicitWidth = 607
    inherited ToolBar: TToolBar
      Width = 592
      ExplicitWidth = 592
      inherited tbNuevo: TToolButton
        Hint = 'Ver Archivo'
        ImageIndex = 14
        Visible = True
        OnClick = tbNuevoClick
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
    Top = 141
    Width = 607
    Height = 229
    Columns = <
      item
        Expanded = False
        FieldName = 'RB_PROYECTO'
        Title.Caption = 'Proyecto'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RB_PATHCOMPLETOMODULO'
        Title.Caption = 'Path M'#243'dulo'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOMODULO'
        Title.Caption = 'Tipo'
        Width = 34
        Visible = True
      end>
  end
  object pnFile: TPanel [3]
    Left = 195
    Top = 256
    Width = 242
    Height = 37
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Visible = False
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT RB_PROYECTO, RB_PATHCOMPLETOMODULO,'
      
        '       UPPER(SUBSTR(RB_PATHCOMPLETOMODULO, LENGTH(RB_PATHCOMPLET' +
        'OMODULO)-2)) TIPOMODULO'
      '  FROM FRB_RESULTADOBUSQUEDA'
      '  ')
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
