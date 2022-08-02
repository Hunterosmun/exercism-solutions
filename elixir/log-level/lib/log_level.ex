defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level === 0 && !legacy? -> :trace
      level === 0 && legacy? -> :unknown
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      level === 5 && !legacy? -> :fatal
      level === 5 && legacy? -> :unknown
      true -> :unknown
    end
    # cond(level, legacy?)
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      legacy? && label === :unknown -> :dev1
      label === :unknown -> :dev2
      true -> nil
    end
  end
end
