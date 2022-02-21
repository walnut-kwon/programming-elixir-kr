defmodule Simple do
  @type atom_list :: list(atom)
  @spec count_atoms(atom_list)  :: non_neg_integer
  def count_atoms(list) do
    length list
  end
end
