<?php
/**
 * Created by PhpStorm.
 * User: alx
 * Date: 1/23/17
 * Time: 10:14 AM
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');

jimport('joomla.form.formfield');

require_once dirname(__DIR__).'/helper.php';

class JFormFieldBoxes extends JFormField {
    protected $type = 'Boxes';

    function getInput(){
        $doc = JFactory::getDocument();
        $doc->addStyleSheet('/plugins/vmpayment/cryptocoin/assets/css/style.css');
        $doc->addScript('/plugins/vmpayment/cryptocoin/assets/js/boxes.js');

        $v = $this->value;
        $coins = CryptoCoinHelper::getCoins();
        $coin_options = array( JHtml::_('select.option', '', JText::_('SELECT_COIN')));
        foreach($coins as $c){
            $coin_options[] = JHtml::_('select.option', $c, $c);
        }
        $js = 'var empty_box = ';
        $html = array();
        $html[] = '<div class="row">';
        $html[] = '<div class="col-md-2">'. JText::_('BOX_COIN');
        $html[] = '</div>';
        $html[] = '<div class="col-md-3">';
        $html[] = JHtml::_('select.genericlist', $coin_options, $name = $this->name.'[0][]', $attribs = null,
            $key = 'value', $text = 'text', $selected = null, $idtag = false, $translate = false );
        $html[] = '</div>';
        $html[] = '<div class="col-md-2">'.JText::_('BOX_KEY');
        $html[] = '</div>';
        $html[] = '<div class="col-md-4">';
        $html[] = '<input type="text" name="'.$this->name.'[1][]" value="" >';
        $html[] = '</div>';
        $html[] = '<div class="col-md-1"><span class="icon-cancel"></span></div>';
        $html[] = '</div>';
        $js .= json_encode($html). ';';
        $doc->addScriptDeclaration($js);
        $html = array('<div class="brd">');
            if($this->value){
                foreach($this->value as $v){
                    list($coin, $hash) = $v;
                    $html[] = '<div class="row">';
                    $html[] = '<div class="col-md-2">'. JText::_('BOX_COIN');
                    $html[] = '</div>';
                    $html[] = '<div class="col-md-3">';
                    $html[] = JHtml::_('select.genericlist', $coin_options, $name = $this->name.'__[0][]', $attribs = null,
                        $key = 'value', $text = 'text', $selected = $coin, $idtag = false, $translate = false );
                    $html[] = '</div>';
                    $html[] = '<div class="col-md-2">'.JText::_('BOX_KEY');
                    $html[] = '</div>';
                    $html[] = '<div class="col-md-4">';
                    $html[] = '<input type="text" name="'.$this->name.'__[1][]" value="'.$hash.'" >';
                    $html[] = '</div>';
                    $html[] = '<div class="col-md-1"><span class="icon-cancel"></span></div>';
                    $html[] = '</div>';
                }
            }

            $html[] = '<div class="row">';
            $html[] = '<div class="col-md-2">'. JText::_('BOX_COIN');
            $html[] = '</div>';
            $html[] = '<div class="col-md-3">';
            $html[] = JHtml::_('select.genericlist', $coin_options, $name = $this->name.'[0][]', $attribs = null,
                $key = 'value', $text = 'text', $selected = null, $idtag = false, $translate = false );
            $html[] = '</div>';
            $html[] = '<div class="col-md-2">'.JText::_('BOX_KEY');
            $html[] = '</div>';
            $html[] = '<div class="col-md-4">';
            $html[] = '<input type="text" name="'.$this->name.'[1][]" value="" >';
            $html[] = '</div>';
            $html[] = '<div class="col-md-1"><span class="icon-new"></span></div>';
            $html[] = '</div>';

        $html[] = '</div>';
        $html[] = '<input class="boxes" type="hidden" name="'.$this->name . '">';

        return implode('', $html);


    }

}