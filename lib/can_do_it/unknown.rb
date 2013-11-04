require 'can_do_it/base'
module CanDoIt
module Unknown

include CanDoIt::Base

protected

  def can_modify_default?(obj);       false; end

  def can_create_default?(parent);    false; end

  def can_see_default?(obj);          true;  end

end
end
