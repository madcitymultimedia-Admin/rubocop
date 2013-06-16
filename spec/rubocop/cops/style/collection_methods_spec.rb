# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe CollectionMethods do
        let(:cm) { CollectionMethods.new }

        it 'registers an offence for collect' do
          inspect_source(cm, ['[1, 2, 3].collect { |e| e + 1 }'])
          expect(cm.offences.size).to eq(1)
          expect(cm.offences.map(&:message))
            .to eq(['Prefer map over collect.'])
        end

        it 'registers an offence for inject' do
          inspect_source(cm, ['[1, 2, 3].inject { |e| e + 1 }'])
          expect(cm.offences.size).to eq(1)
          expect(cm.offences.map(&:message))
            .to eq(['Prefer reduce over inject.'])
        end

        it 'registers an offence for detect' do
          inspect_source(cm, ['[1, 2, 3].detect { |e| e + 1 }'])
          expect(cm.offences.size).to eq(1)
          expect(cm.offences.map(&:message))
            .to eq(['Prefer find over detect.'])
        end

        it 'registers an offence for find_all' do
          inspect_source(cm, ['[1, 2, 3].find_all { |e| e + 1 }'])
          expect(cm.offences.size).to eq(1)
          expect(cm.offences.map(&:message))
            .to eq(['Prefer select over find_all.'])
        end

        it 'ignores find_all without an explicit receiver' do
          inspect_source(cm, ['find_all { |e| e + 1 }'])
          expect(cm.offences).to be_empty
        end
      end
    end
  end
end
