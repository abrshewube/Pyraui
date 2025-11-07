defmodule Pyraui.Components.VideoPlayer do
  @moduledoc """
  Video Player component with custom controls for embedded videos.

  ## Examples

      <.video_player src="/videos/example.mp4" poster="/images/poster.jpg" />
      <.video_player src="https://example.com/video.mp4" autoplay={true} />
  """

  use Phoenix.Component

  attr :src, :string, required: true, doc: "Video source URL"
  attr :poster, :string, default: nil, doc: "Poster image URL"
  attr :autoplay, :boolean, default: false, doc: "Autoplay video"
  attr :loop, :boolean, default: false, doc: "Loop video"
  attr :muted, :boolean, default: false, doc: "Mute video"
  attr :controls, :boolean, default: true, doc: "Show controls"
  attr :width, :string, default: "100%", doc: "Video width"
  attr :height, :string, default: nil, doc: "Video height"
  attr :class, :string, default: ""
  attr :rest, :global

  def video_player(assigns) do
    ~H"""
    <div class={["video-player-container relative", @class]} {@rest}>
      <video
        src={@src}
        poster={@poster}
        autoplay={@autoplay}
        loop={@loop}
        muted={@muted}
        controls={@controls}
        class="w-full h-auto rounded-lg"
        style={"width: #{@width}; #{if @height, do: "height: #{@height};", else: ""}"}
      >
        Your browser does not support the video tag.
      </video>
    </div>
    """
  end
end
