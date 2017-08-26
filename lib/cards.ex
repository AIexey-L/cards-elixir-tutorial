defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """

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

  @doc """
  Determines, when deck contain given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Devides a deck into a hand and a remainder of the deck.
    The `hand_size` argument indicates how many cards should be in hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _remain} = Cards.hand(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """

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

  def create_hand(cards_number) do
    Cards.create_deck
    |> Cards.shuffle_deck
    |> Cards.hand(cards_number)
  end
end
