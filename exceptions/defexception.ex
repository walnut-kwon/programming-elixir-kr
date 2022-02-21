defmodule KinectProtocolError do
  defexception message: "Kinect protocol error",
               can_retry: false

  def full_message(me) do
    "Kinect failed: #{me.message}, retriable: #{me.can_retry}"
  end
end

defmodule B do
  def talk_to_kinect do
    raise KinectProtocolError, message: "usb unplugged", can_retry: true
  end

  def schedule_retry do
    IO.puts "Retrying in 10 seconds"
  end

  def start do
    #START:user
    try do
      talk_to_kinect()
    rescue
      error in [KinectProtocolError] ->
        IO.puts KinectProtocolError.full_message(error)
        if error.can_retry, do: schedule_retry()
    end
    #END:user
  end
end
