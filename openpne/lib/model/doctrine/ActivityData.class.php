<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * ActivityData
 *
 * This class has been auto-generated by the Doctrine ORM Framework
 *
 * @package    OpenPNE
 * @subpackage model
 * @author     Shogo Kawahara <kawahara@bucyou.net>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
class ActivityData extends BaseActivityData
{
  public function getPublicFlagCaption()
  {
    return $this->getTable()->publicFlagToCaption($this->getPublicFlag());
  }
}
