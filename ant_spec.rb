# -*- coding: utf-8 -*-
require_relative 'ant'

describe Ant do
  describe "#fact" do
    it "0の階乗が1になること" do
      Ant.fact(0).should eq 1
    end

    it "5の階乗が120になること" do
      Ant.fact(5).should eq 120
    end
  end
end
