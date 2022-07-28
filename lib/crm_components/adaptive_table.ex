defmodule CrmComponents.AdaptiveTable do
  use Phoenix.Component

  import CrmComponents.Avatar
  import CrmComponents.Helpers

  def table(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:rest, fn ->
        assigns_to_attributes(assigns, ~w(
          class
        )a)
      end)

    ~H"""
    <table
      class={
        build_class([
          # "min-w-full overflow-hidden divide-y ring-1",
          # "ring-gray-200 dark:ring-0 divide-gray-200",
          # "rounded-sm table-auto dark:divide-y-0",
          # "dark:divide-gray-800 sm:rounded",
          "min-w-full divide-y divide-gray-300",
          @class
        ])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </table>
    """
  end

  def th(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:rest, fn ->
        assigns_to_attributes(assigns, ~w(
          class
        )a)
      end)

    ~H"""
    <th
      class={
        build_class(
          [
            "px-3 py-3.5 text-left text-sm font-semibold text-gray-900",
            @class
          ],
          " "
        )
      }
      {@rest}
    >
      <%= if @inner_block do %>
        <%= render_slot(@inner_block) %>
      <% end %>
    </th>
    """
  end

  def tr(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:rest, fn ->
        assigns_to_attributes(assigns, ~w(
          class
        )a)
      end)

    ~H"""
    <tr
      class={
        build_class([
          @class
        ])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </tr>
    """
  end

  def td(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:rest, fn ->
        assigns_to_attributes(assigns, ~w(
          class
        )a)
      end)

    ~H"""
    <td
      class={
        build_class(
          [
            "px-6 py-4 text-sm text-gray-500 dark:text-gray-400",
            @class
          ],
          " "
        )
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </td>
    """
  end

  def user_inner_td(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:avatar_assigns, fn -> nil end)
      |> assign_rest(~w(class avatar_assigns label sub_label)a)

    ~H"""
    <div class={@class} {@rest}>
      <div class="flex items-center gap-3">
        <%= if @avatar_assigns do %>
          <.avatar {@avatar_assigns} />
        <% end %>

        <div class="flex flex-col overflow-hidden">
          <div class="overflow-hidden font-medium text-gray-900 whitespace-nowrap text-ellipsis dark:text-gray-300">
            <%= @label %>
          </div>
          <div class="overflow-hidden font-normal text-gray-500 whitespace-nowrap text-ellipsis">
            <%= @sub_label %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp td_classes(opts) do
    opts = %{
      size: opts[:size] || "md",
      variant: opts[:variant] || "solid",
      color: opts[:color] || "primary",
      loading: opts[:loading] || false,
      disabled: opts[:disabled] || false,
      icon: opts[:icon] || false,
      user_added_classes: opts[:class] || ""
    }


    size_css =
      case opts[:size] do
        "xs" -> "text-xs leading-4 px-2.5 py-1.5"
        "sm" -> "text-sm leading-4 px-3 py-2"
        "md" -> "text-sm leading-5 px-4 py-2"
        "lg" -> "text-base leading-6 px-4 py-2"
        "xl" -> "text-base leading-6 px-6 py-3"
      end

    loading_css =
      if opts[:loading] do
        "flex gap-2 items-center whitespace-nowrap disabled cursor-not-allowed"
      else
        ""
      end

    icon_css =
      if opts[:icon] do
        "flex gap-2 items-center whitespace-nowrap"
      else
        ""
      end

    [
      opts.user_added_classes,
      size_css,
      loading_css,
      icon_css,
      "font-medium rounded-md inline-flex items-center justify-center border focus:outline-none transition duration-150 ease-in-out"
    ]
    |> build_class()
  end
end
