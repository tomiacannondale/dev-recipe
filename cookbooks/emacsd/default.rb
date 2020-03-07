git "#{node[:homed][:path]}/.emacs.d" do
  repository node[:emacsd][:repository]
  user "ishiduka"
end

directory "#{node[:homed][:path]}/.emacs.d/elisp" do
  user "ishiduka"
end

git "#{node[:homed][:path]}/.emacs.d/elisp/exec-path-from-shell" do
  repository "https://github.com/purcell/exec-path-from-shell"
  user "ishiduka"
end
