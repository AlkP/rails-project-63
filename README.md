### Hexlet tests and linter status:
[![Actions Status](https://github.com/AlkP/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AlkP/rails-project-63/actions)


пример использования

      HexletCode.form_for user, url: '#' do |f|
        f.input :name
        f.input :job, as: :text, rows: 50, cols: 50

        f.submit "Wow"
      end
