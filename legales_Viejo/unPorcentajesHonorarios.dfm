inherited frmPorcentajesHonorarios: TfrmPorcentajesHonorarios
  Left = 64
  Top = 99
  Width = 616
  Height = 450
  Caption = 'Porcentajes de Honorarios'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 608
    Visible = True
    DesignSize = (
      608
      45)
    object gbEstudio: TGroupBox
      Left = 2
      Top = -1
      Width = 605
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 0
      DesignSize = (
        605
        44)
      inline fraEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 592
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          592
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 538
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
  end
  inherited CoolBar: TCoolBar
    Width = 608
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 604
      end>
    inherited ToolBar: TToolBar
      Width = 591
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 608
    Height = 349
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Gestor'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'Nombre Gestor'
        Width = 355
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HONORARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Honorario'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 126
    Width = 398
    Height = 118
    Constraints.MaxHeight = 118
    Constraints.MaxWidth = 398
    Constraints.MinHeight = 118
    Constraints.MinWidth = 398
    OnEnter = fpAbmEnter
    inherited BevelAbm: TBevel
      Top = 82
      Width = 390
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 57
      Width = 62
      Height = 13
      Caption = '% Honorarios'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 88
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 318
      Top = 88
      TabOrder = 3
    end
    object gbEstudioAM: TGroupBox
      Left = 6
      Top = 5
      Width = 386
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 0
      DesignSize = (
        386
        44)
      inline frafpEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 373
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          373
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 318
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
    object edfpPorcentaje: TCurrencyEdit
      Left = 76
      Top = 54
      Width = 46
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GC_ID CODIGO, GC_NOMBRE ESTUDIO, HG_HONORARIO HONORARIO, ' +
        'HG_FECHABAJA FECHA_BAJA'
      '  FROM AGC_GESTORCUENTA, LHG_HONORARIOGESTOR'
      ' WHERE GC_ID = HG_IDGESTOR'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
end
