defmodule CrmComponents do
  @moduledoc """
  Documentation for `CrmComponents`.
  """

  defmacro __using__(_) do
    quote do
      alias CrmComponents.Heroicons

      import CrmComponents.{
      AdaptiveTable,
      Alert,
        Badge,
        Button,
        Container,
        Dropdown,
        Form,
        Loading,
        Typography,
        Avatar,
        Progress,
        Breadcrumbs,
        Pagination,
        Link,
        Modal,
        SlideOver,
        # Tabs,
        CustomTabs,
        Card,
        # Table,
        Accordion
      }
    end
  end
end
