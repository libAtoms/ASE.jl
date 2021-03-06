

############################################################
# matscipy neighbourlist functionality
############################################################

function neighbourlist(at::ASEAtoms, cutoff::Float64)
   if ASE.hasmatscipy
      return MatSciPy.NeighbourList(at, cutoff)
   else
      @error("matscipy not available. The MolSimPy package must be used for this additional functionality.")
      return nothing
   end
end

# TODO: no longer needed in the new ASE design
# """
# `static_neighbourlist(at::ASEAtoms, rcut::Float64)`
#
# This function first checks whether a static neighbourlist already exists
# with cutoff `rcut` and if it does then it returns the existing list.
# If it does not, then it computes a new neighbour list with the current
# configuration, stores it for later use and returns it.
# """
# function static_neighbourlist(at::ASEAtoms, rcut::Float64)
#    # if !has_transient(at, (:snlist, rcut))
#    #    set_transient!( at, (:snlist, rcut),
#    #                        MatSciPy.NeighbourList(at, rcut),
#    #                        Inf )    # Inf means this is never deleted!
#    # end
#    # return get_transient(at, (:snlist, rcut))
#    return MatSciPy.NeighbourList(at, rcut)
# end
