defmodule ExUptimerobot.AlertContact do
  @moduledoc """
  Interact with Alert Contact -related API methods.
  """
  alias ExUptimerobot.Request

  @doc """
  Get all alert contacts, or a set of contacts as specified by params. Full
  documentation for all parameters can be found from https://uptimerobot.com/api.
  """
  @spec get_alert_contacts([tuple]) :: tuple
  def get_alert_contacts(params \\ []) do
    with {:ok, body} <- Request.post("getAlertContacts", params),
         {:ok, body} <- Poison.Parser.parse(body)
    do
      {:ok, body}
    else
      {:error, reason} -> {:error, reason}
      _                -> {:error, "Error getting alert contacts"}
    end
  end
end