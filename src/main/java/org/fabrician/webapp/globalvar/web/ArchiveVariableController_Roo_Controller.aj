// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.fabrician.webapp.globalvar.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.fabrician.webapp.globalvar.domain.ArchiveVariable;
import org.fabrician.webapp.globalvar.web.ArchiveVariableController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ArchiveVariableController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ArchiveVariableController.create(@Valid ArchiveVariable archiveVariable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, archiveVariable);
            return "archivevariables/create";
        }
        uiModel.asMap().clear();
        archiveVariable.persist();
        return "redirect:/archivevariables/" + encodeUrlPathSegment(archiveVariable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ArchiveVariableController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ArchiveVariable());
        return "archivevariables/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ArchiveVariableController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("archivevariable", ArchiveVariable.findArchiveVariable(id));
        uiModel.addAttribute("itemId", id);
        return "archivevariables/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ArchiveVariableController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("archivevariables", ArchiveVariable.findArchiveVariableEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ArchiveVariable.countArchiveVariables() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("archivevariables", ArchiveVariable.findAllArchiveVariables(sortFieldName, sortOrder));
        }
        return "archivevariables/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ArchiveVariableController.update(@Valid ArchiveVariable archiveVariable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, archiveVariable);
            return "archivevariables/update";
        }
        uiModel.asMap().clear();
        archiveVariable.merge();
        return "redirect:/archivevariables/" + encodeUrlPathSegment(archiveVariable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ArchiveVariableController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ArchiveVariable.findArchiveVariable(id));
        return "archivevariables/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ArchiveVariableController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ArchiveVariable archiveVariable = ArchiveVariable.findArchiveVariable(id);
        archiveVariable.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/archivevariables";
    }
    
    void ArchiveVariableController.populateEditForm(Model uiModel, ArchiveVariable archiveVariable) {
        uiModel.addAttribute("archiveVariable", archiveVariable);
    }
    
    String ArchiveVariableController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
