<?php

/**
 * LICENSE: The MIT License (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * https://github.com/azure/azure-storage-php/LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * PHP version 5
 *
 * @category  Microsoft
 * @package   MicrosoftAzure\Storage\Tests\Framework
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @link      https://github.com/azure/azure-storage-php
 */
 
namespace MicrosoftAzure\Storage\Tests\framework;

use MicrosoftAzure\Storage\Common\Internal\Logger;
use MicrosoftAzure\Storage\Common\Internal\Serialization\XmlSerializer;
use MicrosoftAzure\Storage\Common\ServicesBuilder;

/**
 * Testbase for all REST proxy tests.
 *
 * @category  Microsoft
 * @package   MicrosoftAzure\Storage\Tests\Framework
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @version   Release: 0.12.1
 * @link      https://github.com/azure/azure-storage-php
 */
class RestProxyTestBase extends \PHPUnit_Framework_TestCase
{
    protected $restProxy;
    protected $xmlSerializer;
    protected $builder;
    
    protected function getTestName()
    {
        return sprintf('onesdkphp%04x', mt_rand(0, 65535));
    }
    
    public static function assertHandler($file, $line, $code)
    {
        echo "Assertion Failed:\n
            File '$file'\n
            Line '$line'\n
            Code '$code'\n";
    }
    
    public function __construct()
    {
        $this->xmlSerializer = new XmlSerializer();
        $this->builder = new ServicesBuilder();
        Logger::setLogFile('C:\log.txt');
        
        // Enable PHP asserts
        assert_options(ASSERT_ACTIVE, 1);
        assert_options(ASSERT_WARNING, 0);
        assert_options(ASSERT_QUIET_EVAL, 1);
        assert_options(ASSERT_CALLBACK, 'MicrosoftAzure\Storage\Tests\Framework\RestProxyTestBase::assertHandler');
    }
    
    public function setProxy($serviceRestProxy)
    {
        $this->restProxy = $serviceRestProxy;
    }
    
    protected function onNotSuccessfulTest(\Exception $e)
    {
        parent::onNotSuccessfulTest($e);
        
        $this->tearDown();
        throw $e;
    }
}
