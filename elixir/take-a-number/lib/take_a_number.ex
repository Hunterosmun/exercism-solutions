defmodule TakeANumber do
  def start(), do: spawn(fn -> the_process(0) end)

  def the_process(num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, num)
        the_process(num)

      {:take_a_number, sender_pid} ->
        send(sender_pid, num + 1)
        the_process(num + 1)

      :stop ->
        nil

      _ ->
        the_process(num)
    end
  end
end
