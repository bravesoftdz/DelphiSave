inherited frmManRelevamientosPactados: TfrmManRelevamientosPactados
  Caption = 'Relevamientos Pactados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'FP_ID'
        Title.Caption = 'C'#243'digo'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FP_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FP_FECHAPACTADA'
        Title.Caption = 'Fecha Pactada'
        Width = 88
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 68
    Top = 128
    Width = 498
    Height = 104
    inherited BevelAbm: TBevel
      Top = 68
      Width = 490
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 38
      Width = 73
      Height = 13
      Caption = 'Fecha Pactada'
    end
    inherited btnAceptar: TButton
      Left = 340
      Top = 74
    end
    inherited btnCancelar: TButton
      Left = 418
      Top = 74
    end
    inline fraEmpresa: TfraEmpresa
      Left = 44
      Top = 5
      Width = 447
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
      TabOrder = 2
      DesignSize = (
        447
        21)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 343
      end
      inherited edContrato: TIntEdit
        Left = 390
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 199
        Columns = <
          item
            Expanded = False
            FieldName = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Caption = 'Contrato'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciadesde'
            Title.Caption = 'Vigencia Desde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciahasta'
            Title.Caption = 'Vigencia Hasta'
            Visible = True
          end>
      end
    end
    object edFechaPactada: TDateEdit
      Left = 94
      Top = 33
      Width = 94
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT fp_id, fp_contrato, fp_fechapactada, fp_usualta, fp_fecha' +
        'alta, fp_usumodif, fp_fechamodif, fp_usubaja, fp_fechabaja,'
      '       em_nombre'
      
        '  FROM hys.hfp_fechapactadarelev, afi.aco_contrato, afi.aem_empr' +
        'esa'
      ' WHERE co_contrato = fp_contrato'
      '   AND em_id = co_idempresa')
  end
end
