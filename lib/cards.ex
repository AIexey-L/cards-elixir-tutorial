defmodule Cards do

  def create_deck do
    values = ["Ace", "One", "Two", "Three", "Four"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def include?(deck, card) do
    Enum.member?(deck, card)
  end

  def hand(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> 
        :erlang.binary_to_term(binary)
      {:error, _message} ->
        "That file does not exist"
    end

  end

end
