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

  describe "#fib" do
    it "0番目のフィボナッチ数列が0になること" do
      Ant.fib(0).should eq 0
    end

    it "1番目のフィボナッチ数列が1になること" do
      Ant.fib(1).should eq 1
    end

    it "2番目のフィボナッチ数列が1になること" do
      Ant.fib(2).should eq 1
    end

    it "3番目のフィボナッチ数列が2になること" do
      Ant.fib(3).should eq 2
    end

    it "4番目のフィボナッチ数列が3になること" do
      Ant.fib(4).should eq 3
    end

    it "5番目のフィボナッチ数列が5になること" do
      Ant.fib(5).should eq 5
    end
  end

  describe "#dfs" do
    it "aに[1, 2, 4, 7], kに13 が渡された場合、trueになること" do
      a = [1, 2, 4, 7]
      Ant.dfs(a, 13).should be_true
    end

    it "aに[1, 2, 4, 7], kに15 が渡された場合、falseになること" do
      a = [1, 2, 4, 7]
      Ant.dfs(a, 15).should be_false
    end
  end

  describe "#dfs_pool" do
    it "庭の水たまりが3つであること" do
      garden = [
        %w(W . . . . . . . . W W .),
        %w(. W W W . . . . . W W W),
        %w(. . . . W W . . . W W .),
        %w(. . . . . . . . . W W .),
        %w(. . . . . . . . . W . .),
        %w(. . W . . . . . . W . .),
        %w(. W . W . . . . . W W .),
        %w(W . W . W . . . . . W .),
        %w(. W . W . . . . . . W .),
        %w(. . W . . . . . . . W .),
      ]
      Ant.count_pool(garden).should eq 3
    end
  end

  describe "#bfs" do
    it "迷路のゴールまでの最小ターン数が22であること" do
      maze = [
        %w(# S # # # # # # . #),
        %w(. . . . . . # . . #),
        %w(. # . # # . # # . #),
        %w(. # . . . . . . . .),
        %w(# # . # # . # # # #),
        %w(. . . . # . . . . #),
        %w(. # # # # # # # . #),
        %w(. . . . # . . . . .),
        %w(. # # # # . # # # .),
        %w(. . . . # . . . G #),
      ]
      Ant.bfs(maze).should eq 22
    end
  end
end
