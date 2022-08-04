defmodule TakeANumber do
  def start(), do: spawn(&the_process/0)

  def the_process(num \\ 0) do
    receive do
      {:report_state, sender_pid} -> action({:report_state, sender_pid}, num)
      {:take_a_number, sender_pid} -> action({:take_a_number, sender_pid}, num)
      :stop -> action(:stop)
      _ -> the_process(num)
    end
  end

  def action({:report_state, sender_pid}, num) do
    send(sender_pid, num)
    the_process(num)
  end

  def action({:take_a_number, sender_pid}, num) do
    send(sender_pid, num + 1)
    the_process(num + 1)
  end

  def action(:stop), do: nil
end
